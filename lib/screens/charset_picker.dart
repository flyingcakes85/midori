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
import 'package:get/get.dart';

import 'package:midori/screens/quiz_screen.dart';
import 'package:midori/quiz_time_data.dart' as QuizTimeData;
import 'package:midori/romaji_maps.dart';

class CharSetDialog extends StatefulWidget {
  final int chosenCharSet;
  CharSetDialog(this.chosenCharSet);
  @override
  _CharSetDialogState createState() => _CharSetDialogState(chosenCharSet);
}

class _CharSetDialogState extends State<CharSetDialog> {
  static const List<List<String>> charSetLeaderLabels = [
    ["46", "All Monographs"],
    ["25", "All Diacritics"],
    ["36", "All Digraphs"],
  ];

  static const List<List<List<String>>> charSetIndividual = [
    [
      ["5", "a - group\nあ"],
      ["5", "ka - group\nか"],
      ["5", "sa - group\nさ"],
      ["5", "ta - group\nた"],
      ["5", "na - group\nな"],
      ["5", "ha - group\nは"],
      ["5", "ma - group\nま"],
      ["3", "ya - group\nや"],
      ["5", "ra - group\nら"],
      ["3", "wa - group\nわ"],
      ["5", "ga - group\nが"],
      ["5", "za - group\nざ"],
      ["5", "da - group\nだ"],
      ["5", "ba - group\nば"],
      ["5", "pa - group\nぱ"],
      ["5", "kya, sha - group\nきゃ、しゃ"],
      ["5", "cha, nya - group\nちゃ、にゃ"],
      ["5", "hya, mya - group\nひゃ、みゃ"],
      ["5", "rya, gya - group\nりゃ、ぎゃ"],
      ["5", "jya, dzya - group\nじゃ、ぢゃ"],
      ["5", "bya, pya - group\nびゃ、ぴゃ"],
    ],
    [
      ["5", "a - group\nア"],
      ["5", "ka - group\nカ"],
      ["5", "sa - group\nサ"],
      ["5", "ta - group\nタ"],
      ["5", "na - group\nナ"],
      ["5", "ha - group\nハ"],
      ["5", "ma - group\nマ"],
      ["3", "ya - group\nヤ"],
      ["5", "ra - group\nラ"],
      ["3", "wa - group\nワ"],
      ["5", "ga - group\nガ"],
      ["5", "za - group\nザ"],
      ["5", "da - group\nダ"],
      ["5", "ba - group\nバ"],
      ["5", "pa - group\nパ"],
      ["5", "kya, sha - group\nキャ、シャ"],
      ["5", "cha, nya - group\nチャ、ニャ"],
      ["5", "hya, mya - group\nヒャ、ミャ"],
      ["5", "rya, gya - group\nリャ、ギャ"],
      ["5", "jya, dzya - group\nジャ、ヂャ"],
      ["5", "bya, pya - group\nビャ、ピャ"],
    ],
  ];

  final int chosenCharSet;
  _CharSetDialogState(this.chosenCharSet);

  List<bool> selected = [];
  List<bool> leaderCheck = [];
  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < 21; i++) {
      selected.add(false);
    }
    for (int i = 0; i < 3; i++) {
      leaderCheck.add(false);
    }
    return Scaffold(
        appBar: AppBar(
          elevation: 3,
          title: Text("Choose topics"),
          actions: [
            TextButton(
              onPressed: () {
                List<List<String>> quizEntries = [];

                // if (chosenCharSet == 0) {
                // Hiragana
                //   for (int idx = 0; idx < 4; idx++) {
                //     if (selected[idx] == true) {
                //       quizEntries.addAll(RomajiMaps.hiraganaMap[idx]);
                //     }
                //   }
                // } else {
                //   // Katakana
                //   for (int idx = 0; idx < 4; idx++) {
                //     if (selected[idx] == true) {
                //       quizEntries.addAll(RomajiMaps.katakanaMap[idx]);
                //     }
                //   }
                // }
                for (int i = 0; i < 21; i++) {
                  if (selected[i]) {
                    quizEntries.addAll(chosenCharSet == 0
                        ? RomajiMaps.hiraganaMap.elementAt(i)
                        : RomajiMaps.katakanaMap.elementAt(i));
                  }
                }
                if (quizEntries.length == 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Row(
                        children: [
                          Icon(Icons.warning_amber_outlined),
                          SizedBox(width: 6),
                          Text("You need to select at least one option."),
                        ],
                      ),
                    ),
                  );
                } else {
                  quizEntries.shuffle();
                  Navigator.pop(context, selected);
                  QuizTimeData.quizEntries = quizEntries;
                  QuizTimeData.currentQuestionIndex = 0;
                  QuizTimeData.score = 0;
                  Get.to(() => QuizScreen());
                }
              },
              child: Text("START"),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Text(
                    'Select the kana sets you want to practice:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )),
              buildCheckBoxLeader(0, 0, 9),
              GridView.count(
                crossAxisCount: 2,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                childAspectRatio: 3,
                children: List.generate(
                  10,
                  (index) => buildCheckboxListTile(index, 0),
                ),
              ),
              CategoryDivider(),
              buildCheckBoxLeader(1, 10, 14),
              GridView.count(
                crossAxisCount: 2,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                childAspectRatio: 3,
                children: List.generate(
                  5,
                  (index) => buildCheckboxListTile(index + 10, 1),
                ),
              ),
              CategoryDivider(),
              buildCheckBoxLeader(2, 15, 20),
              GridView.count(
                crossAxisCount: 2,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                childAspectRatio: 2,
                children: List.generate(
                  6,
                  (index) => buildCheckboxListTile(index + 15, 2),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    child: const Text('CONTINUE'),
                    onPressed: () {
                      print(selected);
                      List<List<String>> quizEntries = [];

                      if (chosenCharSet == 0) {
                        // Hiragana
                        for (int idx = 0; idx < 4; idx++) {
                          if (selected[idx] == true) {
                            quizEntries.addAll(RomajiMaps.hiraganaMap[idx]);
                          }
                        }
                      } else {
                        // Katakana
                        for (int idx = 0; idx < 4; idx++) {
                          if (selected[idx] == true) {
                            quizEntries.addAll(RomajiMaps.katakanaMap[idx]);
                          }
                        }
                      }
                      if (quizEntries.length == 0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Row(
                              children: [
                                Icon(Icons.warning_amber_outlined),
                                SizedBox(width: 6),
                                Text("You need to select at least one option."),
                              ],
                            ),
                          ),
                        );
                      } else {
                        quizEntries.shuffle();
                        Navigator.pop(context, selected);
                        QuizTimeData.quizEntries = quizEntries;
                        QuizTimeData.currentQuestionIndex = 0;
                        QuizTimeData.score = 0;
                        Navigator.pushNamed(
                          context,
                          QuizScreen.routeName,
                          arguments: QuizArguments(),
                        );
                      }
                    },
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ]),
          ),
        ));
  }

  CheckboxListTile buildCheckBoxLeader(int index, int start, int end) {
    return CheckboxListTile(
      checkColor: Colors.white,
      activeColor: Colors.green,
      title: Text(
        charSetLeaderLabels.elementAt(index).elementAt(1) +
            " (" +
            charSetLeaderLabels[index][0] +
            ")",
        style: TextStyle(fontSize: 18),
      ),
      // secondary: Text(charSetLeaderLabels[index][0]),
      value: leaderCheck[index],
      onChanged: (bool value) {
        setState(() {
          leaderCheck[index] = value;
          for (int i = start; i <= end; i++) {
            selected[i] = value;
          }
        });
      },
    );
  }

  CheckboxListTile buildCheckboxListTile(int index, int leader) {
    return CheckboxListTile(
      checkColor: Colors.white,
      activeColor: Colors.green,
      title: Text(charSetIndividual
              .elementAt(chosenCharSet)
              .elementAt(index)
              .elementAt(1) +
          " (" +
          charSetIndividual
              .elementAt(chosenCharSet)
              .elementAt(index)
              .elementAt(0) +
          ")"),
      value: selected[index],
      onChanged: (bool value) {
        setState(() {
          selected[index] = value;
          if (!value) {
            leaderCheck[leader] = value;
          }
        });
      },
    );
  }
}

class CategoryDivider extends StatelessWidget {
  const CategoryDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 18,
      thickness: 2,
      indent: 18,
      endIndent: 18,
    );
  }
}
