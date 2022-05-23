import 'package:flutter/material.dart';

class TextOutput extends StatelessWidget {
  const TextOutput({Key? key, required this.textOutput}) : super(key: key);

  final String textOutput;

  @override
  Widget build(BuildContext context) {
    return Text(
      textOutput,
      style: const TextStyle(
        fontSize: 32,
      ),
    );
  }
}
