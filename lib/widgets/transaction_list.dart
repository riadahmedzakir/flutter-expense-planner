import 'package:flutter/material.dart';
import 'package:flutter_expense_planner/widgets/transaction.dart';
import 'package:flutter_expense_planner/widgets/transaction_add.dart';
import 'package:flutter_expense_planner/widgets/transaction_card.dart';

class TransactionList extends StatefulWidget {
  List<Transaction> _transactions;
  final Function _addNewTransaction;

  TransactionList(this._transactions, this._addNewTransaction);

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 400,
            child: SingleChildScrollView(
              child: Column(
                  children: widget._transactions
                      .map((tx) => TransactionCard(tx: tx))
                      .toList()),
            ),
          )
        ],
      ),
    );
  }
}
