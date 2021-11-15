import 'package:flutter/material.dart';
import 'package:flutter_expense_planner/widgets/transaction.dart';
import 'package:flutter_expense_planner/widgets/transaction_card.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Katana', amount: 200.99, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((tx) => TransactionCard(tx: tx)).toList(),
    );
  }
}
