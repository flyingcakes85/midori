import 'package:flutter/material.dart';

class QuizArguments {
  final List<bool> quizContents;
  final int chosenChar;

  QuizArguments(this.chosenChar, this.quizContents);
}

class QuizScreen extends StatefulWidget {
  static const routeName = '/quizArguments';

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    final QuizArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
      ),
      body: Center(
        child: Text(args.quizContents.toString()),
      ),
    );
  }
}
