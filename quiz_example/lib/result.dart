import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int result;
  final VoidCallback resetCallback;
  const Result({
    Key? key,
    required this.result,
    required this.resetCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Your score is $result',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 36),
          ),
          Text(
            resultPhrase,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: resetCallback,
            child: const Text('Reset Quiz'),
          ),
        ],
      ),
    );
  }

  String get resultPhrase {
    if (result <= 9) {
      return 'Weirdo!';
    } else if (result <= 12) {
      return 'You are... strange?!';
    } else if (result <= 21) {
      return 'Pretty likeable!';
    } else {
      return 'You are awesome!!!';
    }
  }
}
