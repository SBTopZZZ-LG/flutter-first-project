import 'package:flutter/material.dart';

import 'question.dart';
import 'answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  String _answerPattern = "";

  final Map _qnas = const {
    "questions": [
      "What's your favourite colour?",
      "What's your favourite animal?",
      "What's your favourite number?",
    ],
    "answers": [
      ["Orange", "White", "Black"],
      ["Monke", "Spider", "Polar Bear"],
      [2, 4, 8],
    ],
    "matchPairs": ["012", "112", "121", "200", "212"]
  };

  void answerQuestion(int answerIndex) {
    answerIndex--;
    _answerPattern = _answerPattern + answerIndex.toString();
    setState(() {
      _questionIndex++;
    });
  }

  bool checkAnswer() {
    return (_qnas["matchPairs"]).contains(_answerPattern);
  }

  void resetQuiz() {
    setState(() {
      _answerPattern = "";
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    int key = 0;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: _questionIndex < _qnas["questions"].length
            ? Column(
                children: [
                  Question(
                      "${_questionIndex < _qnas["questions"].length ? _qnas["questions"][_questionIndex] : _qnas["questions"][_qnas["questions"].length - 1]}",
                      _questionIndex + 1),
                  ...(_qnas["answers"][
                          _questionIndex >= _qnas["questions"].length
                              ? _qnas["questions"].length - 1
                              : _questionIndex] as List)
                      .map((value) {
                    key++;
                    return Answer(
                        answerIndex: key,
                        onPressedCallback: answerQuestion,
                        btnText:
                            "${_questionIndex < _qnas["questions"].length ? (_qnas["answers"][_questionIndex] as List)[key - 1] : (_qnas["answers"][_qnas["questions"].length - 1] as List)[key - 1]}");
                  }).toList(),
                ],
              )
            : Center(
                child: Column(
                  children: [
                    Text(
                      checkAnswer()
                          ? "Damn, you are smart!"
                          : "Seems like you slipped somewhere...",
                      style: TextStyle(fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                    ElevatedButton(
                        onPressed: resetQuiz, child: Text("Reset Quiz")),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
      ),
    );
  }
}
