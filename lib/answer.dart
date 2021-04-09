import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function onPressedCallback;
  final String btnText;
  final int answerIndex;

  Answer(
      {@required this.onPressedCallback,
      this.btnText,
      @required this.answerIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ElevatedButton(
      onPressed: () => onPressedCallback(answerIndex),
      child: Text(btnText),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.blue),
      ),
    ));
  }
}
