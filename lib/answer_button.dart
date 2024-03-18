import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.text, required this.onTapAnswer});

  final String text;
  final void Function() onTapAnswer;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTapAnswer, 
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        backgroundColor: const Color.fromARGB(200, 50, 60, 120),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))
      ),
      child: Text(text),
    );
  }
}