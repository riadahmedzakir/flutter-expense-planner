import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_expense_planner/widgets/root.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    // DeviceOrientation.portraitUp,
    // DeviceOrientation.portraitUp,
  ]);
  runApp(Root());
}
