// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_expense_planner/widgets/home.dart';

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense planner',
      theme: ThemeData(
          primarySwatch: Colors.cyan,
          errorColor: Colors.red,
          fontFamily: 'Quicksand',
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                    headline6: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    button: TextStyle(color: Colors.white),
                  ))),
      home: Home(),
    );
  }
}
