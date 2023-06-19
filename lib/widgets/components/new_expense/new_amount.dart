import 'package:flutter/material.dart';

class NewExpenseAmount extends StatelessWidget {
  const NewExpenseAmount({required this.amountController, super.key});
  final TextEditingController amountController;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: amountController,
        keyboardType: TextInputType.number,
        decoration:
            const InputDecoration(prefix: Text('₹'), labelText: 'Amount'),
      ),
    );
  }
}
