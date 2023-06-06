import 'package:flutter/material.dart';

class InfoText extends StatelessWidget {
  const InfoText({required this.text, super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.blue,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        letterSpacing: 1.2,
        decorationColor: Colors.blue,
        decorationStyle: TextDecorationStyle.dotted,
      ),
    );
  }
}
