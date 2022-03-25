import 'package:flutter/material.dart';
import 'package:flutter_widgets_basic/text_control/text_to_show.dart';

class TextControl extends StatefulWidget {
  const TextControl({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TextControlState();
}

class _TextControlState extends State<TextControl> {
  int _count = 0;
  String _textToShow = 'Click to count';

  void _onChangeClicked() {
    setState(() {
      _count++;
      _textToShow = 'Clicked $_count times!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextToShow(textToShow: _textToShow),
          ElevatedButton(onPressed: _onChangeClicked, child: Text(_textToShow)),
        ],
      ),
    );
  }
}
