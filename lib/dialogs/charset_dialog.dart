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
      {'lead': '21', 'text': 'Next 21 Hiragana\nは - を'},
      {'lead': '25', 'text': 'Dakuten Kana\nが - ぽ'},
      {'lead': '36', 'text': 'Combo Hiragana\nきゃ - ぴょ'}
    },
    {
      {'lead': '25', 'text': 'First 25 Katakana\nア - ノ'},
      {'lead': '21', 'text': 'Next 21 Katakana\nハ - ヲ'},
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
            buildCheckboxListTile(0),
            buildCheckboxListTile(1),
            buildCheckboxListTile(2),
            buildCheckboxListTile(3),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('CONTINUE'),
                  onPressed: () {
                    print(_checked);
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
                      Navigator.pop(context, _checked);
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
        ));
  }

  CheckboxListTile buildCheckboxListTile(int index) {
    return CheckboxListTile(
      checkColor: Colors.white,
      activeColor: Colors.green,
      title: Text(charSet.elementAt(chosenCharSet).elementAt(index)['text']),
      secondary:
          Text(charSet.elementAt(chosenCharSet).elementAt(index)['lead']),
      value: _checked[index],
      onChanged: (bool value) {
        setState(() {
          _checked[index] = value;
        });
      },
    );
  }
}
