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
import 'package:shared_preferences/shared_preferences.dart';

class StatsScreen extends StatefulWidget {
  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  int _rightAns;

  int _wrongAns;

  int _skipped;

  TextStyle numberDisplay =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 48);

  @override
  Widget build(BuildContext context) {
    _getStats() async {
      final prefs = await SharedPreferences.getInstance();
      if (!mounted) return;
      setState(() {
        _rightAns = (prefs.getInt('rightAns') ?? 0);
        prefs.setInt('rightAns', _rightAns);

        _wrongAns = (prefs.getInt('wrongAns') ?? 0);
        prefs.setInt('wrongAns', _wrongAns);

        _skipped = (prefs.getInt('skipped') ?? 0);
        prefs.setInt('skipped', _skipped);
      });
    }

    _getStats();
    return Center(
        child: Container(
      padding: EdgeInsets.only(top: 50),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Column(children: [
              Text(_rightAns.toString(), style: numberDisplay),
              Text('Correct'),
            ]),
          ),
          Expanded(
            flex: 1,
            child: Column(children: [
              Text(_wrongAns.toString(), style: numberDisplay),
              Text('Wrong'),
            ]),
          ),
          Expanded(
            flex: 1,
            child: Column(children: [
              Text(_skipped.toString(), style: numberDisplay),
              Text('Skipped'),
            ]),
          )
        ],
      ),
    ));
  }
}
