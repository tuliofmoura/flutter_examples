import 'package:flutter/material.dart';
import 'package:flutter_widgets_basic/text_control/text_control.dart';

void main(List<String> args) => runApp(const TextControlApp());

class TextControlApp extends StatelessWidget {
  const TextControlApp({Key? key}) : super(key: key);

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
