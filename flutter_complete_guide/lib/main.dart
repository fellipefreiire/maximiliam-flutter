import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;

  void answerQuestion() {
    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    List<String> questions = [
      'What\'s your favorite color?',
      'What\'s your favorite animal?',
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first app'),
        ),
        body: Column(
          children: <Widget>[
            Question(questionText: questions[_questionIndex]),
            ElevatedButton(
              onPressed: answerQuestion,
              child: Text('Answer 1'),
            ),
            ElevatedButton(
              onPressed: () {
                print('Answer 2');
              },
              child: Text('Answer 2'),
            ),
            ElevatedButton(
              onPressed: () {
                print('Answer 2');
              },
              child: Text('Answer 3'),
            ),
          ],
        ),
      ),
    );
  }
}
