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
      setState(() {
        _rightAns = (prefs.getInt('rightAns') ?? 0);
        prefs.setInt('rightAns', _rightAns);
      });
      setState(() {
        _wrongAns = (prefs.getInt('wrongAns') ?? 0);
        prefs.setInt('wrongAns', _wrongAns);
      });
      setState(() {
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
