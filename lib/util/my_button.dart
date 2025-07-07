import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed; // Callback function to handle button press

  // Constructor to initialize the button with text and onPressed callback
  MyButton({
    super.key,
    required this.text,
    required this.onPressed,
    required ButtonStyle style,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      child: Text(text),
    );
  }
}
