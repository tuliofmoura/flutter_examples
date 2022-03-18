import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback answerCallback;
  final String answerText;
  const Answer(
    this.answerCallback,
    this.answerText, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: answerCallback,
        child: Text(answerText),
      ),
    );
  }
}
