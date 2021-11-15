import 'package:flutter/material.dart';

class TransactionChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: const Card(
          color: Colors.blue,
          child: Text('Chart'),
          elevation: 5,
        ));
  }
}
