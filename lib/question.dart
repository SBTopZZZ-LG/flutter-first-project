import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final int questionIndex;
  final String questionText;

  Question(this.questionText, this.questionIndex);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Text(
          "Question $questionIndex",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Text(
          questionText,
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ]),
      width: double.infinity,
      margin: EdgeInsets.all(50),
    );
  }
}
