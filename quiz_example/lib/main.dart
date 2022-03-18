import 'package:flutter/material.dart';
import 'package:quiz_example/quiz.dart';
import 'package:quiz_example/result.dart';

void main(List<String> args) => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _totalScore = 0;
  int _questionIndex = 0;
  final _questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Blue', 'score': 10},
        {'text': 'Red', 'score': 7},
        {'text': 'Green', 'score': 4},
        {'text': 'Yellow', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Dog', 'score': 10},
        {'text': 'Tiger', 'score': 7},
        {'text': 'Cow', 'score': 4},
        {'text': 'Cat', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite programing language?',
      'answers': [
        {'text': 'Dart', 'score': 10},
        {'text': 'Java', 'score': 7},
        {'text': 'Python', 'score': 4},
        {'text': 'JavaScript', 'score': 1},
      ],
    }
  ];

  void _onAnswered(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
    debugPrint('$_totalScore');
  }

  void _onRestarted() {
    _totalScore = 0;
    _questionIndex = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My app"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerCallback: _onAnswered,
              )
            : Result(result: _totalScore, resetCallback: _onRestarted),
      ),
    );
  }
}
