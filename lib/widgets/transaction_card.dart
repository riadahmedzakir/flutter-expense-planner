import 'package:flutter/material.dart';
import 'package:flutter_expense_planner/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final Transaction tx;
  final Function _deleteTransaction;

  TransactionCard(this.tx, this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(
                    color: Theme.of(context).primaryColorDark, width: 1)),
            child: Container(
              width: 70,
              child: Tooltip(
                message: '\$${tx.amount.toString()}',
                child: Text(
                  '\$${tx.amount.toString()}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: false,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).primaryColorDark),
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      tx.title,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat.yMMMd().format(tx.date),
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: IconButton(
                    onPressed: () => _deleteTransaction(tx.id),
                    icon: Icon(Icons.delete),
                    color: Theme.of(context).errorColor,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
