import 'package:flutter/material.dart';
import 'package:flutter_expense_planner/widgets/transaction.dart';
import 'package:flutter_expense_planner/widgets/transaction_add.dart';
import 'package:flutter_expense_planner/widgets/transaction_card.dart';

class TransactionList extends StatefulWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Katana', amount: 200.99, date: DateTime.now()),
  ];

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TransactionAdd(_addNewTransaction),
          Container(
            height: 400,
            child: SingleChildScrollView(
              child: Column(
                  children: _transactions
                      .map((tx) => TransactionCard(tx: tx))
                      .toList()),
            ),
          )
        ],
      ),
    );
  }
}
