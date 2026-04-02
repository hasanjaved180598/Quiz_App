import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
    this.restartQuiz, {
    super.key,
    required this.chosenAnswers,
  });

  final void Function() restartQuiz;
  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            SizedBox(height: 30),
            QuestionsSummary(getSummaryData()),
            SizedBox(height: 30),
            TextButton(
              onPressed: () {
                restartQuiz();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.restart_alt_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(width: 10),
                  Text("Restart Quiz!", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
