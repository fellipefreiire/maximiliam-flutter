import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveButton extends StatelessWidget {
  const AdaptiveButton({Key? key, required this.text, required this.handler})
      : super(key: key);

  final String text;
  final VoidCallback handler;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: handler,
            child: const Text(
              'Choose Date',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        : TextButton(
            onPressed: handler,
            child: const Text(
              'Choose Date',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          );
  }
}
