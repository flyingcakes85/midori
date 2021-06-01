import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:midori/romaji_maps.dart';
import 'package:midori/screens/train_screen.dart';

class LearnStatus extends StatelessWidget {
  // 0 for Hiragana
  // 1 for Katakana
  final int chosenCharset;
  final Color cardColor;

  LearnStatus(this.chosenCharset, this.cardColor);

  final prefs = GetStorage();

  final List<List<String>> topicListingHiragana = [
    [
      'あ',
      'か',
      'さ',
      'た',
      'な',
      'は',
      'ま',
      'や',
      'ら',
      'わ',
      'が',
      'ざ',
      'だ',
      'ば',
      'ぱ',
      'きゃ、しゃ',
      'ちゃ、にゃ',
      'ひゃ、みゃ',
      'りゃ、ぎゃ',
      'じゃ、ぢゃ',
      'びゃ、ぴゃ',
    ],
    [
      'ア',
      'カ',
      'サ',
      'タ',
      'ナ',
      'ハ',
      'マ',
      'ヤ',
      'ラ',
      'ワ',
      'ガ',
      'ザ',
      'ダ',
      'バ',
      'パ',
      'キャ、シャ',
      'チャ、ニャ',
      'ヒャ、ミャ',
      'リャ、ギャ',
      'ジャ、ヂャ',
      'ビャ、ピャ',
    ]
  ];

  @override
  Widget build(BuildContext context) {
    List<bool> isCompleted = [];
    List<List<String>> chosenKana = [];

    for (int i = 0; i < 21; i++) {
      if (chosenCharset == 0) {
        isCompleted.add((prefs.read("h" + i.toString()) ?? false));
      } else {
        isCompleted.add((prefs.read("k" + i.toString()) ?? false));
      }
    }

    print(isCompleted);
    return Container(
      child: Scaffold(
        appBar: AppBar(
          elevation: 3,
          title: Text(chosenCharset == 0 ? "Hiragana" : "Katakana"),
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CategoryLabel("Monographs"),
                SizedBox(height: 8),
                GridView.count(
                  crossAxisCount: 5,
                  // childAspectRatio: 2,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: List.generate(
                    10,
                    (index) {
                      return GestureDetector(
                        onTap: () {
                          chosenKana.clear();
                          chosenKana.addAll(chosenCharset == 0
                              ? RomajiMaps.hiraganaMap.elementAt(index)
                              : RomajiMaps.katakanaMap.elementAt(index));
                          if (chosenCharset == 0) {
                            Navigator.pop(context);
                            Get.to(() => TrainScreen(
                                chosenKana, "h" + index.toString()));
                          } else {
                            Navigator.pop(context);
                            Get.to(() => TrainScreen(
                                chosenKana, "k" + index.toString()));
                          }
                        },
                        child: Card(
                          color: isCompleted[index] ? Colors.green : cardColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                topicListingHiragana
                                    .elementAt(chosenCharset)
                                    .elementAt(index),
                                style: TextStyle(fontSize: 20),
                              ),
                              // Expanded(flex: 1, child: Container()),
                              // Icon(Icons.arrow_right_alt)
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 8),
                CategoryLabel("Diacritics"),
                SizedBox(height: 8),
                GridView.count(
                  crossAxisCount: 5,
                  // childAspectRatio: 2,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: List.generate(
                    5,
                    (index) {
                      return GestureDetector(
                        onTap: () {
                          chosenKana.clear();
                          chosenKana.addAll(chosenCharset == 0
                              ? RomajiMaps.hiraganaMap.elementAt(index + 10)
                              : RomajiMaps.katakanaMap.elementAt(index + 10));

                          if (chosenCharset == 0) {
                            Navigator.pop(context);
                            Get.to(() => TrainScreen(
                                chosenKana, "h" + (index + 10).toString()));
                          } else {
                            Navigator.pop(context);
                            Get.to(() => TrainScreen(
                                chosenKana, "k" + (index + 10).toString()));
                          }
                        },
                        child: Card(
                          color: isCompleted[index + 10]
                              ? Colors.green
                              : cardColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                topicListingHiragana
                                    .elementAt(chosenCharset)
                                    .elementAt(index + 10),
                                style: TextStyle(fontSize: 18),
                              ),
                              // Expanded(flex: 1, child: Container()),
                              // Icon(Icons.arrow_right_alt)
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 8),
                CategoryLabel("Digraphs / (with diacritics)"),
                SizedBox(height: 8),
                GridView.count(
                  crossAxisCount: 3,
                  // childAspectRatio: 2,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: List.generate(
                    6,
                    (index) {
                      return GestureDetector(
                        onTap: () {
                          chosenKana.clear();
                          chosenKana.addAll(chosenCharset == 0
                              ? RomajiMaps.hiraganaMap.elementAt(index + 15)
                              : RomajiMaps.katakanaMap.elementAt(index + 15));
                          if (chosenCharset == 0) {
                            Navigator.pop(context);
                            Get.to(() => TrainScreen(
                                chosenKana, "h" + (index + 15).toString()));
                          } else {
                            Navigator.pop(context);
                            Get.to(() => TrainScreen(
                                chosenKana, "k" + (index + 15).toString()));
                          }
                        },
                        child: Card(
                          color: isCompleted[index + 15]
                              ? Colors.green
                              : cardColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                topicListingHiragana
                                    .elementAt(chosenCharset)
                                    .elementAt(index + 15),
                                style: TextStyle(fontSize: 18),
                              ),
                              // Expanded(flex: 1, child: Container()),
                              // Icon(Icons.arrow_right_alt)
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryLabel extends StatelessWidget {
  final String label;

  CategoryLabel(this.label);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(fontSize: 22),
    );
  }
}
