import 'package:flutter/material.dart';
import 'package:Midori/romaji_maps.dart';

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

    //Form the questions array here
    List quizEntries = List();

    if (args.chosenChar == 0) {
      // Hiragana
      for (int idx = 0; idx < 4; idx++) {
        if (args.quizContents[idx] == true) {
          quizEntries.addAll(RomajiMaps.hiraganaMap[idx]);
        }
      }
    } else {
      // Katakana
      for (int idx = 0; idx < 4; idx++) {
        if (args.quizContents[idx] == true) {
          quizEntries.addAll(RomajiMaps.hiraganaMap[idx]);
        }
      }
    }

    quizEntries.shuffle();
    int currentQuestionIndex = 0;

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Quiz'),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 10),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 45),
                child: Text(
                  'Identify the kana shown:',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Text(
                quizEntries[currentQuestionIndex][0],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 72,
                ),
              ),
              Expanded(child: Container()),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter your answer',
                        labelText: 'Type Romaji equivalent',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    flex: 1,
                    child: RaisedButton(
                      child: Icon(
                        Icons.arrow_right_alt,
                        color: Colors.white,
                      ),
                      color: Colors.green[400],
                      onPressed: () => {/** */},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            actionsPadding: EdgeInsets.only(right: 15, bottom: 15),
            title: new Text('Really abort quiz?'),
            content: new Text(
                'This will abort the quiz and current scoers will not be added to the total.'),
            actions: <Widget>[
              GestureDetector(
                onTap: () => Navigator.of(context).pop(false),
                child: Text("NO"),
              ),
              SizedBox(height: 16, width: 10),
              GestureDetector(
                onTap: () => Navigator.of(context).pop(true),
                child: Text("YES"),
              ),
            ],
          ),
        ) ??
        false;
  }
}
