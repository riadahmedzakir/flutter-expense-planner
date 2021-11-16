import 'package:flutter/material.dart';
import 'package:flutter_expense_planner/models/transaction.dart';
import 'package:flutter_expense_planner/widgets/transaction_chart_bar.dart';
import 'package:intl/intl.dart';

class TransactionChart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }

      return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
    }).reversed.toList();
  }

  double get maxSpending {
    return groupedTransactionValues.fold(
        0.0,
        (previousValue, element) =>
            previousValue + (element['amount'] as double));
  }

  TransactionChart(this.recentTransactions);

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape
            ? true
            : false;

    return Container(
      height: isLandscape
          ? MediaQuery.of(context).size.height * 0.43
          : MediaQuery.of(context).size.height * 0.22,
      child: Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransactionValues.map((data) {
              return Flexible(
                fit: FlexFit.tight,
                child: TransactionChartBar(
                  data['day'] as String,
                  data['amount'] as double,
                  maxSpending == 0.0
                      ? 0.0
                      : (data['amount'] as double) / maxSpending,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
