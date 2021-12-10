import 'package:flutter/material.dart';
import 'clothes_answer.dart';
import 'clothes_question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  void _iWasTapped() {
    setState(() {
      _questionIndex += 1;
    });
    print('I was tapped');
  }

  var questions = [
    {
      'question': "Select brand",
      'answer': [
        'Zara',
        'Pull & Bear',
        'Massimo Dutti',
      ]
    },
    {
      'question': "Select clothing type",
      'answer': [
        'Shirt',
        'Pants',
        'Jacket',
      ]
    },
    {
      'question': "Select material type",
      'answer': [
        'Cotton',
        'Silk',
        'Denim',
      ]
    },
  ];
  var _questionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("App Bar"),
        ),
        body: Column(
          children: [
            ClothesQuestion(questions[_questionIndex]['question'].toString()),
            ...(questions[_questionIndex]['answer'] as List<String>)
                .map((answer) {
              return ClothesAnswer(_iWasTapped, answer);
            }),
          ],
        ),
      ),
    );
  }
}

