import 'package:flutter/material.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

String startScreenString = 'start-screen';
String questionScreenString = 'question-screen';
String resultScreenString = 'result-screen';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  String activeScreen = startScreenString;
  List<String> selectedAnswers = [];

  void switchScreen() {
    setState(() {
      activeScreen = questionScreenString;
    });
  }

  void selectAnswer(String value) {
    selectedAnswers.add(value);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = resultScreenString;
      });
    }
  }

  void onRestartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = startScreenString;
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(startQuiz: switchScreen);
    if (activeScreen == questionScreenString) {
      screenWidget = QuestionScreen(selectAnswer: selectAnswer);
    }
    if (activeScreen == resultScreenString) {
      screenWidget = ResultScreen(onRestart: onRestartQuiz, selectedAnswers: selectedAnswers);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple,
                Colors.deepOrange
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            )
          ),
          child: screenWidget,
        )
      ),
    );
  }
}