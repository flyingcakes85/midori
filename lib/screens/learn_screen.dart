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
import 'package:midori/widgets/learn_card.dart';

class LearnScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          LearnCard('Hiragana / ひらがな', 'Learn and test in short bites', 0),
          LearnCard('Katakana / カタカナ', 'Learn and test in short bites', 1),
        ]));
  }
}
