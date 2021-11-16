import 'package:flutter/material.dart';
import 'package:flutter_expense_planner/models/transaction.dart';
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
    return widget._transactions.isEmpty
        ? Container(
            height: 600,
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
