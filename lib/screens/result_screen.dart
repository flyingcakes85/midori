import 'package:flutter/material.dart';
import 'package:Midori/quiz_time_data.dart';
import 'package:Midori/quiz_time_data.dart' as QuizTimeData;

class ResultArguments {
  ResultArguments();
}

abstract class AnswerListSkel {
  Widget resultRow(BuildContext context);
}

class AnswerListItem implements AnswerListSkel {
  final String kana;
  final String romaji;
  final String userAnswer;

  AnswerListItem(this.kana, this.romaji, this.userAnswer);

  Widget resultRow(BuildContext context) {
    return Card(
        elevation: 2,
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 1,
                  child: Center(
                      child: Text(
                    kana,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  )),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                      child: Text(
                    romaji,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green),
                  )),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                      child: Text(
                    userAnswer,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: romaji == userAnswer
                            ? Colors.green
                            : (userAnswer == '-' ? Colors.grey : Colors.red)),
                  )),
                ),
              ],
            )));
  }
}

class ResultScreen extends StatefulWidget {
  static const routeName = '/resultscreen';

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    final wrongItems = List<AnswerListItem>.generate(
      wrongAnswers.length,
      (i) => AnswerListItem(
        QuizTimeData.wrongAnswers.elementAt(i)[0],
        QuizTimeData.wrongAnswers.elementAt(i)[1],
        QuizTimeData.wrongAnswers.elementAt(i)[2],
      ),
    );

    final rightItems = List<AnswerListItem>.generate(
      QuizTimeData.rightAnswers.length,
      (i) => AnswerListItem(
        QuizTimeData.rightAnswers.elementAt(i)[0],
        QuizTimeData.rightAnswers.elementAt(i)[1],
        QuizTimeData.rightAnswers.elementAt(i)[2],
      ),
    );
    final skippedItems = List<AnswerListItem>.generate(
      QuizTimeData.skippedAnswers.length,
      (i) => AnswerListItem(
        QuizTimeData.skippedAnswers.elementAt(i)[0],
        QuizTimeData.skippedAnswers.elementAt(i)[1],
        QuizTimeData.skippedAnswers.elementAt(i)[2],
      ),
    );

    final listItems = wrongItems + skippedItems + rightItems;

    // final ResultArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: Text('Results!'),
        ),
        body: Container(
          padding: EdgeInsets.all(15),
          child: Center(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Text(
                            QuizTimeData.score.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 72,
                              color: Colors.green,
                            ),
                          ),
                          Text('Your Score:'),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Text(
                            QuizTimeData.wrongAnswers.length.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 72,
                              color: Colors.red,
                            ),
                          ),
                          Text('Wrong Answers:'),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Text(
                            QuizTimeData.skippedAnswers.length.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 72,
                              color: Colors.grey,
                            ),
                          ),
                          Text('Skipped'),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    // Let the ListView know how many items it needs to build.
                    itemCount: listItems.length,
                    // Provide a builder function. This is where the magic happens.
                    // Convert each item into a widget based on the type of item it is.
                    itemBuilder: (context, index) {
                      final item = listItems[index];

                      return ListTile(
                        dense: true,
                        title: item.resultRow(context),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
