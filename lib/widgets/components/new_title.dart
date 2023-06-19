import 'package:flutter/material.dart';

class NewExpenseTitle extends StatelessWidget {
  const NewExpenseTitle({required this.titleController, super.key});
  final TextEditingController titleController;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: titleController,
      maxLength: 50,
      decoration: const InputDecoration(labelText: 'Title'),
    );
  }
}
