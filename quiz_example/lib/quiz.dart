import 'package:flutter/material.dart';
import 'package:quiz_example/question.dart';

import 'answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerCallback;
  const Quiz({
    required this.questions,
    required this.questionIndex,
    required this.answerCallback,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'] as String,
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) => Answer(
                  () => answerCallback(answer['score']),
                  answer['text'] as String,
                ))
            .toList(),
      ],
    );
  }
}
