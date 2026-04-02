import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = "start-screen";

  List<String> selectedAnswer = [];

  void switchScreen() {
    setState(() {
      activeScreen = "question-screen";
    });
  }

  void choosenAnswer(String answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = "results-screen";
      });
    }
  }

  void restartQuiz() {
    setState(() {
      activeScreen = "question-screen";
      selectedAnswer = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == "question-screen") {
      screenWidget = QuestionScreen(onSelectedAnswer: choosenAnswer);
    } else if (activeScreen == "results-screen") {
      screenWidget = ResultsScreen(restartQuiz, chosenAnswers: selectedAnswer);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.deepPurpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
