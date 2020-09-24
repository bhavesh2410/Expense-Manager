import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class NewTransaction extends StatefulWidget {

  final Function addNewTransaction;


  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  DateTime _selectedDate;
  final _amountController = TextEditingController();

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if(enteredTitle.isEmpty || enteredAmount <= 0 ||
    _selectedDate == null){
      return;
    }
    widget.addNewTransaction(
      enteredTitle,
      enteredAmount,
      _selectedDate
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime.now()
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
          elevation: 5.0,
          child: Container(
            padding: EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
                bottom: MediaQuery.of(context).viewInsets.bottom + 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
//                    onChanged: (value) {
//                      titleInput = value;
//                    },
                  controller: _titleController,
                  decoration: InputDecoration(
                      labelText: 'Title'
                  ),
                  onSubmitted: (_) => _submitData(),
                ),
                TextField(
                  //onChanged: (value) {
                  //  amountInput = value;
                  //},
                  controller: _amountController,
                  decoration: InputDecoration(
                      labelText: 'Amount'
                  ),
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => _submitData(),
                ),
                Container(
                  height: 70.0,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                            _selectedDate == null ?
                            'No Date Chosen' :
                            'Picked Date: ${DateFormat.yMd().format(
                                _selectedDate)}'),
                      ),
                      FlatButton(
                        textColor: Theme.of(context).primaryColor,
                          onPressed: () {
                            _presentDatePicker();
                          },
                          child: Text('Choose Date',
                          style: TextStyle(
                              fontWeight: FontWeight.bold),))
                    ],
                  ),
                ),
                RaisedButton(
                  child: Text('Add Transaction'),
                  color: Theme.of(context).primaryColor,
                  textColor: Theme.of(context).textTheme.button.color,
                  onPressed: _submitData,
                )
              ],
            ),
          )
      ),
    );
  }
}
