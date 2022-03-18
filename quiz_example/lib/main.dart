import 'package:flutter/material.dart';
import 'package:quiz_example/quiz.dart';
import 'package:quiz_example/result.dart';

void main(List<String> args) => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  final _questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': ['Red', 'Blue', 'Green', 'Yellow'],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': ['Dog', 'Cat', 'Tiger', 'Cow'],
    },
    {
      'questionText': 'What\'s your favorite programing language?',
      'answers': ['Dart', 'Java', 'JavaScript', 'Python'],
    }
  ];

  void _onPressed() {
    setState(() {
      _questionIndex++;
    });
    String msg = _questionIndex < _questions.length
        ? 'We have more questions!'
        : 'No more questions!';
    debugPrint(msg);
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
                onPressed: _onPressed,
              )
            : const Result(),
      ),
    );
  }
}
