import 'package:flutter/material.dart';
import 'package:Midori/widgets/learn_card.dart';

class LearnScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          LearnCard('Katakana', 'Learn more on Wikipedia',
              'https://en.wikipedia.org/wiki/Katakana'),
          LearnCard('Hiragana', 'Learn more on Wikipedia',
              'https://en.wikipedia.org/wiki/Hiragana'),
        ]));
  }
}
