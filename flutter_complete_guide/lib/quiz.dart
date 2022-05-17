import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/answer.dart';
import 'package:flutter_complete_guide/question.dart';

class Quiz extends StatelessWidget {
  const Quiz({
    Key? key,
    required this.questions,
    required this.answerQuestion,
    required this.questionIndex,
  }) : super(key: key);

  final List<Map<String, Object>> questions;
  final VoidCallback answerQuestion;
  final int questionIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(
            questionText: questions[questionIndex]['questionText'] as String),
        ...(questions[questionIndex]['answers'] as List<String>).map(
          (answer) {
            return Answer(
              answerText: answer,
              selectHandler: answerQuestion,
            );
          },
        ).toList(),
      ],
    );
  }
}
