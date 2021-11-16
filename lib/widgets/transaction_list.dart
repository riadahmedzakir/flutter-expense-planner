// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_expense_planner/models/transaction.dart';
import 'package:flutter_expense_planner/widgets/transaction_card.dart';

class TransactionList extends StatefulWidget {
  List<Transaction> _transactions;
  final Function _addNewTransaction;
  final Function _deleteTransaction;

  TransactionList(
    this._transactions,
    this._addNewTransaction,
    this._deleteTransaction,
  );

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape
            ? true
            : false;

    return widget._transactions.isEmpty
        ? Container(
            height: isLandscape
                ? MediaQuery.of(context).size.height * 0.6
                : MediaQuery.of(context).size.height * 0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'No transaction added.',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 100,
                  child: Image.asset(
                    'assets/images/empty.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          )
        : Container(
            child: Column(
              children: [
                Container(
                  height: isLandscape
                      ? MediaQuery.of(context).size.height * 0.6
                      : MediaQuery.of(context).size.height * 0.6,
                  child: SingleChildScrollView(
                    child: Column(
                        children: widget._transactions
                            .map((tx) =>
                                TransactionCard(tx, widget._deleteTransaction))
                            .toList()),
                  ),
                )
              ],
            ),
          );
  }
}
