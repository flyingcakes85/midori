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
import 'package:midori/consts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

import 'package:midori/screens/learn_status.dart';

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class LearnCard extends StatelessWidget {
  final String titleText;
  final String subtitleText;
  // final String url;

  // 0 for Hiragana
  // 1 for Katakana
  final int chosenCharset;
  LearnCard(this.titleText, this.subtitleText, this.chosenCharset);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
                backgroundColor: Colors.greenAccent, child: Icon(Icons.public)),
            title: Text(
              titleText,
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Text(
              subtitleText,
              style: TextStyle(fontSize: 18),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('START'),
                onPressed: () {
                  // launchURL(url);
                  Get.to(() => LearnStatus(
                      chosenCharset,
                      Get.isDarkMode
                          ? Consts.darkTheme.cardColor
                          : Consts.lightTheme.cardColor));
                },
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}
