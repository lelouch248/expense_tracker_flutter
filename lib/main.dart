import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/expenses.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Expense Tracker',
      theme: ThemeData(
        brightness: Brightness.dark,
      ).copyWith(useMaterial3: true),
      home: const Expenses(),
    ),
  );
}



// create a widget