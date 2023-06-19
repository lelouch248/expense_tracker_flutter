import 'dart:io';

import 'package:expense_tracker/widgets/components/new_expense/new_addbutton.dart';
import 'package:expense_tracker/widgets/components/new_expense/new_amount.dart';
import 'package:expense_tracker/widgets/components/new_expense/new_cancle_expense.dart';
import 'package:expense_tracker/widgets/components/new_expense/new_date.dart';
import 'package:expense_tracker/widgets/components/new_expense/new_dropdownbutton.dart';
import 'package:expense_tracker/widgets/components/new_expense/new_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({required this.addExpense, super.key});
  final Function(Expense expense) addExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  // an object used to store the value from the user
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 1),
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _showDialog() {
    if (Platform.isAndroid) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid input'),
          content: const Text('Please enter valid title and amount'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
    } else {
      showCupertinoDialog(
          context: context,
          builder: (ctx) => CupertinoAlertDialog(
                title: const Text('Invalid input'),
                content: const Text('Please enter valid title and amount'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: const Text('Okay'),
                  ),
                ],
              ));
    }
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;

    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      _showDialog();
      return;
    }
    widget.addExpense(
      Expense(
        title: _titleController.text,
        amount: enteredAmount,
        date: _selectedDate!,
        category: _selectedCategory,
      ),
    );
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

    return LayoutBuilder(builder: (ctx, constrains) {
      final width = constrains.maxWidth;
      return SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, keyboardSpace + 16),
            child: SizedBox(
              height: 600,
              child: Column(
                children: [
                  if (width >= 600)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: NewExpenseTitle(
                              titleController: _titleController),
                        ),
                        NewExpenseAmount(amountController: _amountController),
                      ],
                    )
                  else
                    NewExpenseTitle(titleController: _titleController),
                  if (width >= 600)
                    Row(
                      children: [
                        NewDropDownButton(
                          selectedCategory: _selectedCategory,
                          onChanged: (value) {
                            if (value == null) {
                              return;
                            }
                            setState(() {
                              _selectedCategory = value;
                            });
                          },
                        ),
                        const SizedBox(width: 24),
                        NewExpenseDate(_selectedDate,
                            presentDatePicker: _presentDatePicker)
                      ],
                    )
                  else
                    Row(
                      children: [
                        NewExpenseAmount(amountController: _amountController),
                        const SizedBox(width: 20),
                        NewExpenseDate(_selectedDate,
                            presentDatePicker: _presentDatePicker)
                      ],
                    ),
                  const SizedBox(height: 20),
                  if (width >= 600)
                    Row(
                      children: [
                        Expanded(
                          child: NewAddExpenseButton(
                              submitExpenseData: _submitExpenseData),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: NewElevatedButton(isDarkMode: isDarkMode),
                        ),
                      ],
                    )
                  else
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        NewDropDownButton(
                          selectedCategory: _selectedCategory,
                          onChanged: (value) {
                            if (value == null) {
                              return;
                            }
                            setState(() {
                              _selectedCategory = value;
                            });
                          },
                        ),
                        const Spacer(),
                        NewAddExpenseButton(
                            submitExpenseData: _submitExpenseData),
                        const SizedBox(width: 20),
                        NewElevatedButton(isDarkMode: isDarkMode),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
