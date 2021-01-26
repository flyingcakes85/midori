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
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart' show rootBundle;

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class AboutScreen extends StatefulWidget {
  static const routeName = '/about_screen';
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  Future<String> getFileData(String path) async {
    return await rootBundle.loadString(path);
  }

  String _licenseText = 'License Text';

  _fetchLicense() async {
    String s = await getFileData('lib/assets/license.txt');
    setState(() {
      _licenseText = s;
    });
  }

  @override
  Widget build(BuildContext context) {
    _fetchLicense();
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Padding(
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
              child: Column(children: [
            Text('Developed by'),
            SizedBox(height: 5),
            Text(
              'Snehit Sah',
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 48),
            ),
            SizedBox(height: 10),
            RaisedButton(
              child: Text('SOURCE CODE ON GITHUB'),
              onPressed: () => launchURL('https://github.com/snehitsah/midori'),
            ),
            SizedBox(height: 20),
            Text(
              'License Text',
              style: TextStyle(fontSize: 24),
            ),
            Text(_licenseText),
          ]))),
    );
  }
}
