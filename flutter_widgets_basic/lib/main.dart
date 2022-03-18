// 1) Create a new Flutter App (in this project) and output an AppBar and some text
// below it
// 2) Add a button which changes the text (to any other text of your choice)
// 3) Split the app into three widgets: App, TextControl (that controls the button) & Text
//appbar and a text below it
//button that changes that text

import 'package:flutter/material.dart';
import 'package:flutter_widgets_basic/text_control.dart';

void main(List<String> args) => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Click count'),
        ),
        body: const TextControl(),
      ),
    );
  }
}
