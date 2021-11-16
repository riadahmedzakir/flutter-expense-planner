import 'package:flutter/material.dart';
import 'package:flutter_expense_planner/widgets/transaction.dart';
import 'package:flutter_expense_planner/widgets/transaction_add.dart';
import 'package:flutter_expense_planner/widgets/transaction_chart.dart';
import 'package:flutter_expense_planner/widgets/transaction_list.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Transaction> _transactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Katana', amount: 200.99, date: DateTime.now()),
  ];

  void _addNewTransaction(String title, double amount) {
    final newTransaction = Transaction(
        title: title,
        amount: amount,
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  void _showTransactionAddModtal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: TransactionAdd(this._addNewTransaction),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense planner'),
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TransactionChart(),
              TransactionList(_transactions, _addNewTransaction)
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _showTransactionAddModtal(context);
        },
      ),
    );
  }
}
