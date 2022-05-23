import 'package:flutter/material.dart';
import 'package:flutter_assignment/textOutput.dart';

class TextController extends StatefulWidget {
  const TextController({Key? key}) : super(key: key);

  @override
  State<TextController> createState() => _TextControllerState();
}

class _TextControllerState extends State<TextController> {
  final String _textOutput1 = 'Changed Text 1';
  final String _textOutput2 = 'Changed Text 2';
  String _textOutput = 'Hello World';

  void changeText() {
    setState(() {
      if (_textOutput == 'Hello World' || _textOutput == 'Changed Text 2') {
        _textOutput = _textOutput1;
      } else {
        _textOutput = _textOutput2;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextOutput(textOutput: _textOutput),
        ElevatedButton(
          onPressed: changeText,
          child: const Text('Change Text'),
        )
      ],
    );
  }
}
