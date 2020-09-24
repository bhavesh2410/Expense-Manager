import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> userTransactions;
  final Function deleteTx;

  TransactionList(this.userTransactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return userTransactions.isEmpty
        ? LayoutBuilder(
        builder: (ctx, constraints) {
          return Column(
            children: <Widget>[
              Container(
                height: constraints.maxHeight * 0.10,
                child: Text('No transactions Added Yet',
                  style: Theme
                      .of(context)
                      .textTheme
                      .title,
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.05,
              ),
              Container(
                height: constraints.maxHeight * 0.6,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,),
              )
            ],
          );
        })
            : ListView.builder(
        itemBuilder: (ctx, index)
    {
      return TransactionItem(userTransactions: userTransactions[index], deleteTx: deleteTx);
    },itemCount
    :
    userTransactions
    .
    length
    ,
    );

  }
}


