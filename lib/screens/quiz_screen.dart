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
    print(quizEntries);

    return WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Quiz'),
          ),
          body: Center(
            child: Text(args.quizContents.toString()),
          ),
        ));
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
