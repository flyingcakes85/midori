import 'package:flutter/material.dart';

import 'package:midori/screens/quiz_screen.dart';
import 'package:midori/quiz_time_data.dart' as QuizTimeData;

class TrainScreen extends StatelessWidget {
  final List<List<String>> charMap;
  final String progressKey;
  TrainScreen(this.charMap, this.progressKey);
  @override
  Widget build(BuildContext context) {
    print(charMap);
    print(progressKey);
    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Learn'),
        actions: [
          TextButton(
            onPressed: () {
              List<List<String>> quizQuestions = charMap;
              print(quizQuestions);
              quizQuestions.shuffle();
              Navigator.pop(context);
              QuizTimeData.quizEntries = quizQuestions;
              QuizTimeData.currentQuestionIndex = 0;
              QuizTimeData.score = 0;
              QuizTimeData.rightAnswers.clear();
              QuizTimeData.wrongAnswers.clear();
              QuizTimeData.skippedAnswers.clear();
              QuizTimeData.prefKey = progressKey;
              Navigator.pushNamed(
                context,
                QuizScreen.routeName,
                arguments: QuizArguments(),
              );
            },
            child: Text("NEXT"),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 18, horizontal: 12),
        child: Column(
          children: [
            Text(
              "Remember the following kana",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Expanded(
              flex: 1,
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(height: 4);
                },
                itemCount: charMap.length,
                itemBuilder: (context, index) {
                  final item = charMap[index];

                  return ListTile(
                    dense: true,
                    title: Card(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              item.elementAt(0),
                              style: TextStyle(fontSize: 24),
                            ),
                            Text(
                              item.elementAt(1),
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                      ),
                    ),
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
