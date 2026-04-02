import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "lib/assets/images/quiz-logo.png",
            width: 200,
            color: Color.fromARGB(150, 255, 255, 255),
          ),
          SizedBox(height: 30),
          Text(
            "Learn Flutter the fun way!",
            style: GoogleFonts.lato(fontSize: 20, color: Colors.white),
          ),
          SizedBox(height: 30),
          OutlinedButton.icon(
            style: ButtonStyle(
              foregroundColor: WidgetStatePropertyAll(Colors.white),
            ),
            onPressed: startQuiz,
            icon: Icon(Icons.arrow_right_alt),
            label: Text(
              "Start Quiz",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
