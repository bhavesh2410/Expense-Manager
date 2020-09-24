import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';


class TransactionItem extends StatefulWidget {

  const TransactionItem({
    Key key,
    @required this.userTransactions,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction userTransactions;
  final Function deleteTx;




  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {

  Color _bgColor;
  @override
  void initState() {
    const availableColors = [
      Colors.red,
      Colors.purple,
      Colors.grey,
      Colors.blue,
      Colors.green
    ];
    _bgColor = availableColors[Random().nextInt(5)];
    super.initState();
  }

    @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FittedBox(
                child: Text('₹ ${widget.userTransactions.amount}')),
          ),
        ),
        title: Text(
          widget.userTransactions.title,
          style: Theme
              .of(context)
              .textTheme
              .title,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(widget.userTransactions.date),
        ),
        trailing: MediaQuery.of(context).size.width > 460 ?
        FlatButton.icon(
            onPressed: () => widget.deleteTx(widget.userTransactions.id),
            icon: const Icon(Icons.delete),
            textColor: Theme.of(context).errorColor,
            label: const Text('Delete')) :
        IconButton(
          icon: const Icon(Icons.delete),
          color: Theme
              .of(context)
              .errorColor,
          onPressed: () {
            widget.deleteTx(widget.userTransactions.id);
          },
        ),

      ),
    );
  }
}