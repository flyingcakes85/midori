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

import 'package:midori/dialogs/charset_dialog.dart';

class ListingCard extends StatelessWidget {
  final String titleText;
  final String subtitleText;
  final int chosenCharSet;
  ListingCard(this.titleText, this.subtitleText, this.chosenCharSet);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.greenAccent,
              child: Center(
                child: Text(
                  chosenCharSet == 0 ? "ひ" : "カ",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
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
                  showDialog(
                    context: context,
                    builder: (context) {
                      return CharSetDialog(chosenCharSet);
                    },
                  );
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
