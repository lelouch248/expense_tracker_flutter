import 'package:flutter/material.dart';

import '../../../models/expense.dart';

class NewExpenseDate extends StatelessWidget {
  const NewExpenseDate(this.selectedDate,
      {required this.presentDatePicker, super.key});
  final DateTime? selectedDate;
  final void Function() presentDatePicker;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            selectedDate != null
                ? formatter.format(selectedDate!)
                : 'No date chosen',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          IconButton(
            onPressed: presentDatePicker,
            icon: const Icon(Icons.calendar_month),
          )
        ],
      ),
    );
  }
}
