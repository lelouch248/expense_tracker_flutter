import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class NewDropDownButton extends StatelessWidget {
  final Category selectedCategory;
  final Function(Category?) onChanged;

  const NewDropDownButton({
    required this.selectedCategory,
    required this.onChanged,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        value: selectedCategory,
        items: Category.values
            .map(
              (category) => DropdownMenuItem(
                value: category,
                child: Text(
                  category.name.toUpperCase(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            )
            .toList(),
        onChanged: onChanged);
  }
}
