import 'package:flutter/material.dart';

class TextControlButton extends StatelessWidget {
  const TextControlButton({Key? key, required this.callback}) : super(key: key);

  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      child: const Text('Change text'),
    );
  }
}
