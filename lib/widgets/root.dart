import 'package:flutter/material.dart';

import 'package:flutter_expense_planner/widgets/transaction_chart.dart';
import 'package:flutter_expense_planner/widgets/transaction_list.dart';

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(title: const Text('Expense planner')),
          body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[TransactionChart(), TransactionList()])),
    );
  }
}
