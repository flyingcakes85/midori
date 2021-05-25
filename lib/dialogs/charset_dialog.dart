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
import 'package:Midori/screens/quiz_screen.dart';
import 'package:Midori/quiz_time_data.dart' as QuizTimeData;
import 'package:Midori/romaji_maps.dart';

class CharSetDialog extends StatefulWidget {
  final int chosenCharSet;
  CharSetDialog(this.chosenCharSet);
  @override
  _CharSetDialogState createState() => _CharSetDialogState(chosenCharSet);
}

class _CharSetDialogState extends State<CharSetDialog> {
  var charSet = {
    {
      {'lead': '25', 'text': 'First 25 Hiragana\nあ - な'},
      {'lead': '20', 'text': 'Next 20 Hiragana\nは - を'},
      {'lead': '25', 'text': 'Dakuten Kana\nが - ぽ'},
      {'lead': '36', 'text': 'Combo Hiragana\nきゃ - ぴょ'}
    },
    {
      {'lead': '25', 'text': 'First 25 Katakana\nア - ノ'},
      {'lead': '20', 'text': 'Next 20 Katakana\nハ - ヲ'},
      {'lead': '25', 'text': 'Dakuten Kana\nガ - ポ'},
      {'lead': '36', 'text': 'Combo Katakana\nキャ - ピョ'}
    }
  };

  final int chosenCharSet;
  _CharSetDialogState(this.chosenCharSet);

  var _checked = [false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return Dialog(
        elevation: 2,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Text(
                  'Select the kana sets you want to practice:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )),
            CheckboxListTile(
              title:
                  Text(charSet.elementAt(chosenCharSet).elementAt(0)['text']),
              secondary:
                  Text(charSet.elementAt(chosenCharSet).elementAt(0)['lead']),
              value: _checked[0],
              onChanged: (bool value) {
                setState(() {
                  _checked[0] = value;
                });
              },
            ),
            CheckboxListTile(
              title:
                  Text(charSet.elementAt(chosenCharSet).elementAt(1)['text']),
              secondary:
                  Text(charSet.elementAt(chosenCharSet).elementAt(1)['lead']),
              value: _checked[1],
              onChanged: (bool value) {
                setState(() {
                  _checked[1] = value;
                });
              },
            ),
            CheckboxListTile(
              title:
                  Text(charSet.elementAt(chosenCharSet).elementAt(2)['text']),
              secondary:
                  Text(charSet.elementAt(chosenCharSet).elementAt(2)['lead']),
              value: _checked[2],
              onChanged: (bool value) {
                setState(() {
                  _checked[2] = value;
                });
              },
            ),
            CheckboxListTile(
              title:
                  Text(charSet.elementAt(chosenCharSet).elementAt(3)['text']),
              secondary:
                  Text(charSet.elementAt(chosenCharSet).elementAt(3)['lead']),
              value: _checked[3],
              onChanged: (bool value) {
                setState(() {
                  _checked[3] = value;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('CONTINUE'),
                  onPressed: () {
                    print(_checked);
                    Navigator.pop(context, _checked);
                    List<List<String>> quizEntries = [];

                    if (chosenCharSet == 0) {
                      // Hiragana
                      for (int idx = 0; idx < 4; idx++) {
                        if (_checked[idx] == true) {
                          quizEntries.addAll(RomajiMaps.hiraganaMap[idx]);
                        }
                      }
                    } else {
                      // Katakana
                      for (int idx = 0; idx < 4; idx++) {
                        if (_checked[idx] == true) {
                          quizEntries.addAll(RomajiMaps.hiraganaMap[idx]);
                        }
                      }
                    }
                    quizEntries.shuffle();
                    QuizTimeData.quizEntries = quizEntries;
                    QuizTimeData.currentQuestionIndex = 0;
                    QuizTimeData.score = 0;
                    Navigator.pushNamed(
                      context,
                      QuizScreen.routeName,
                      arguments: QuizArguments(),
                    );
                  },
                ),
                const SizedBox(width: 10),
              ],
            ),
          ]),
        ));
  }
}
