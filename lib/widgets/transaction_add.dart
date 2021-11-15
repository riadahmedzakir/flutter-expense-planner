// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransactionAdd extends StatelessWidget {
  late String title;
  late String amount;
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
                  onChanged: (val) {
                    title = val;
                  },
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(labelText: 'Amount'),
                  onChanged: (val) {
                    amount = val;
                  },
                ),
                FlatButton(
                    onPressed: () {},
                    textColor: Colors.purple,
                    child: Text('Add transaction'))
              ]),
        ));
  }
}
