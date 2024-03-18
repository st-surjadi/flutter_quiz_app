import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {

  const StartScreen({super.key, required this.startQuiz}); 

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png', 
            width: 300,
            color: Color.fromARGB(180, 255, 255, 255)
          ),
          const SizedBox(height: 50),
          const Text(
            'Learn Flutter The Fun Way!',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: startQuiz, 
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: const BorderSide(width: 2, color: Colors.white)
            ),
            label: const Text('Start Quiz'),
            icon: const Icon(Icons.quiz_outlined)
          )
        ],
      ),
    );
  }
}