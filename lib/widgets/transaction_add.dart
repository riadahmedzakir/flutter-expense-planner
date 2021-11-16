// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class TransactionAdd extends StatefulWidget {
  final Function addTransaction;

  TransactionAdd(this.addTransaction);

  @override
  _TransactionAddState createState() => _TransactionAddState();
}

class _TransactionAddState extends State<TransactionAdd> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _onSubmit() {
    if (_titleController.text != '' &&
        _amountController.text != '' &&
        _selectedDate != null) {
      widget.addTransaction(_titleController.text,
          double.parse(_amountController.text), _selectedDate);
      _titleController.clear();
      _amountController.clear();

      Navigator.of(context).pop();
    }
  }

  void _showDatePicker(context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((pickedData) {
      if (pickedData == null) {
        return;
      }

      setState(() {
        _selectedDate = pickedData;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
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
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(_selectedDate == null
                            ? 'No selected date'
                            : 'Picked Date : ${DateFormat.yMd().format(_selectedDate!)}')),
                    FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      child: Text(
                        'Chose Date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onPressed: () => _showDatePicker(context),
                    )
                  ],
                ),
                RaisedButton(
                    onPressed: _onSubmit,
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    child: Text('Add transaction'))
              ]),
        ),
      ),
    );
  }
}
