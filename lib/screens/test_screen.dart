import 'package:flutter/material.dart';

import 'package:Midori/widgets/listing_card.dart';

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          ListingCard('Hiragana', 'ひらがな', 0),
          ListingCard('Katakana', 'カタカナ', 1),
        ]));
  }
}
