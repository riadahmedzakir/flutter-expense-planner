// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransactionAdd extends StatefulWidget {
  final Function addTransaction;

  TransactionAdd(this.addTransaction);

  @override
  _TransactionAddState createState() => _TransactionAddState(addTransaction);
}

class _TransactionAddState extends State<TransactionAdd> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _amountController = TextEditingController();

  final Function addTransaction;

  _TransactionAddState(this.addTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                  controller: _titleController,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(labelText: 'Amount'),
                  controller: _amountController,
                ),
                FlatButton(
                    onPressed: () {
                            if (_titleController.text != '' &&
                                _amountController.text != '') {
                              addTransaction(_titleController.text,
                                  double.parse(_amountController.text));
                              _titleController.clear();
                              _amountController.clear();
                            }
                          },
                    textColor: Colors.purple,
                    child: Text('Add transaction'))
              ]),
        ));
  }
}
