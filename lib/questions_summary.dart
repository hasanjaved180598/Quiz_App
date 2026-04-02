import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 11, top: 5),
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: data['user_answer'] == data['correct_answer']
                        ? Colors.lightBlueAccent
                        : const Color.fromARGB(255, 229, 132, 246),
                  ),
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        data['correct_answer'] as String,
                        style: TextStyle(color: Colors.lightBlueAccent),
                      ),
                      Text(
                        data['user_answer'] as String,
                        style: TextStyle(
                          color: Color.fromARGB(255, 229, 132, 246),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
