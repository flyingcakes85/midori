import 'package:flutter/material.dart';

class ResultArguments {
  int score;
  List<List<String>> wrongAnswers;

  ResultArguments(this.score, this.wrongAnswers);
}

class ResultScreen extends StatefulWidget {
  static const routeName = '/resultscreen';

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    final ResultArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: Text('Results!'),
        ),
        body: Container(
          padding: EdgeInsets.all(15),
          child: Center(
            child: Column(
              children: [
                Text('Your Score:'),
                Text(
                  args.score.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 72,
                  ),
                ),
                SizedBox(height: 30),
                Text('Wrong Answers:'),
                Text(
                  args.wrongAnswers.length.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 72,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
