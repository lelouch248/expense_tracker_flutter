import 'package:flutter/material.dart';

class NewAddExpenseButton extends StatelessWidget {
  const NewAddExpenseButton({required this.submitExpenseData, super.key});
  final void Function() submitExpenseData;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: submitExpenseData,
      child: const Text('Add expense'),
    );
  }
}
