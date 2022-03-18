// 1) Create a new Flutter App (in this project) and output an AppBar and some text
// below it
// 2) Add a button which changes the text (to any other text of your choice)
// 3) Split the app into three widgets: App, TextControl (that controls the button) & Text
//appbar and a text below it
//button that changes that text

import 'package:flutter/material.dart';
import 'package:flutter_widgets_basic/text.dart';
import 'package:flutter_widgets_basic/text_control_button.dart';

void main(List<String> args) => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _count = 0;
  String _textToShow = 'Some text here';

  void _onChangeClicked() {
    setState(() {
      _count++;
      _textToShow = 'Clicked $_count times!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My App'),
        ),
        body: Center(
          child: Column(
            children: [
              TextToShow(textToShow: _textToShow),
              TextControlButton(callback: _onChangeClicked),
            ],
          ),
        ),
      ),
    );
  }
}
