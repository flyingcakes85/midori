//     This file is part of Midori.

//     Midori is free software: you can redistribute it and/or modify
//     it under the terms of the GNU General Public License as published by
//     the Free Software Foundation, either version 3 of the License, or
//     (at your option) any later version.

//     Midori is distributed in the hope that it will be useful,
//     but WITHOUT ANY WARRANTY; without even the implied warranty of
//     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//     GNU General Public License for more details.

//     You should have received a copy of the GNU General Public License
//     along with Midori.  If not, see <https://www.gnu.org/licenses/>.

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:midori/quiz_time_data.dart';
import 'package:midori/quiz_time_data.dart' as QuizTimeData;

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
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 1,
              child: Center(
                  child: Text(
                kana,
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
            ),
            Expanded(
              flex: 1,
              child: Center(
                  child: Text(
                romaji,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
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
        ));
  }
}

class ResultScreen extends StatelessWidget {
  static const routeName = '/resultscreen';

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
    _saveStats() async {
      final prefs = GetStorage();
      // int rightAns = 0;
      // int wrongAns = 0;
      // int skipped = 0;

      // if (prefs.hasData('rightAns')) {
      //   rightAns = prefs.read('rightAns');
      // }
      // if (prefs.hasData('wrongAns')) {
      //   wrongAns = prefs.read('wrongAns');
      // }
      // if (prefs.hasData('skipped')) {
      //   skipped = prefs.read('skipped');
      // }

      int rightAns = (prefs.read("rightAns") ?? 0);
      int wrongAns = (prefs.read("wrongAns") ?? 0);
      int skipped = (prefs.read("skipped") ?? 0);

      wrongAns += QuizTimeData.wrongAnswers.length;
      rightAns += QuizTimeData.rightAnswers.length;
      skipped += QuizTimeData.skippedAnswers.length;
      prefs.write('rightAns', rightAns);
      prefs.write('wrongAns', wrongAns);
      prefs.write('skipped', skipped);

      QuizTimeData.rightAnswers.clear();
      QuizTimeData.wrongAnswers.clear();
      QuizTimeData.skippedAnswers.clear();

      if (wrongItems.length == 0 &&
          skippedItems.length == 0 &&
          QuizTimeData.prefKey != "null") {
        prefs.write(QuizTimeData.prefKey, true);
        QuizTimeData.prefKey = "null";
      } else {
        Fluttertoast.showToast(
            msg:
                "Retake the test from previous screen and solve all correct to get this mark done",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            fontSize: 16.0);
      }
    }

    _saveStats();
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
                            rightItems.length.toString(),
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
                            wrongItems.length.toString(),
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
                            skippedItems.length.toString(),
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
