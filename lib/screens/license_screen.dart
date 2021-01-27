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
import 'package:flutter/services.dart' show rootBundle;

class LicenseScreen extends StatefulWidget {
  static const routeName = '/license_screen';
  @override
  _LicenseScreenState createState() => _LicenseScreenState();
}

class _LicenseScreenState extends State<LicenseScreen> {
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
          title: Text('License'),
        ),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Text(_licenseText),
          ),
        ));
  }
}
