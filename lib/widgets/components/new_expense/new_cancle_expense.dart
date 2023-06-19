import 'package:flutter/material.dart';

class NewElevatedButton extends StatelessWidget {
  const NewElevatedButton({required this.isDarkMode, super.key});
  final bool isDarkMode;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          isDarkMode ? Colors.grey[800] : Colors.grey[200],
        ),
      ),
      child: const Text('Cancel'),
    );
  }
}
