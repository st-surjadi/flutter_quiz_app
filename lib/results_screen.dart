import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/question_summary/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.onRestart, required this.selectedAnswers});

  final void Function() onRestart;
  final List<String> selectedAnswers;

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final int totalQuestion = questions.length;
    final int totalCorrectAnswer = getSummary().where((data) => data['user_answer'] == data['correct_answer']).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have answered $totalCorrectAnswer out of $totalQuestion questions correctly!',
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white
                )
              ),
            ),
            const SizedBox(height: 20),
            QuestionSummary(summary: getSummary()),
            const SizedBox(height: 20),
            TextButton.icon(
              onPressed: onRestart, 
              label: const Text('Restart Quiz'),
              icon: const Icon(Icons.refresh),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white
              )
            )
          ],
        )
      )
    );
  }
}