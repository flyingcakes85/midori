import 'package:flutter/material.dart';

import 'package:Midori/dialogs/charset_dialog.dart';

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
            leading: Icon(Icons.school),
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
