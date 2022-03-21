import 'package:flutter/material.dart';

class TextToShow extends StatelessWidget {
  const TextToShow({
    Key? key,
    required String textToShow,
  })  : _textToShow = textToShow,
        super(key: key);

  final String _textToShow;

  @override
  Widget build(BuildContext context) {
    return Text(
      _textToShow,
      style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    );
  }
}
