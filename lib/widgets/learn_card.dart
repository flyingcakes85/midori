import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
  final String url;
  LearnCard(this.titleText, this.subtitleText, this.url);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.public),
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
                child: const Text('OPEN IN BROWSER'),
                onPressed: () {
                  /** */
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
