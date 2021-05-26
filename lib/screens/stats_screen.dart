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
import 'package:get_storage/get_storage.dart';
import 'package:pie_chart/pie_chart.dart';

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

  Map<String, double> dataMap;

  @override
  Widget build(BuildContext context) {
    _getStats() async {
      final prefs = GetStorage();
      if (!mounted) return;
      setState(() {
        _rightAns = (prefs.read('rightAns') ?? 0);
        prefs.write('rightAns', _rightAns);

        _wrongAns = (prefs.read('wrongAns') ?? 0);
        prefs.write('wrongAns', _wrongAns);

        _skipped = (prefs.read('skipped') ?? 0);
        prefs.write('skipped', _skipped);
      });

      dataMap = {
        "Correct": _rightAns.toDouble(),
        "Wrong": _wrongAns.toDouble(),
        "Skipped": _skipped.toDouble(),
      };
    }

    _getStats();
    return Center(
        child: Container(
      padding: EdgeInsets.only(top: 50),
      child: Column(
        children: [
          PieChart(
            dataMap: dataMap,
            animationDuration: Duration(milliseconds: 800),
            chartLegendSpacing: 32,
            chartRadius: MediaQuery.of(context).size.width / 3.2,
            colorList: [Colors.green, Colors.red, Colors.amber],
            initialAngleInDegree: 0,
            chartType: ChartType.ring,
            ringStrokeWidth: 32,
            legendOptions: LegendOptions(
              showLegendsInRow: false,
              legendPosition: LegendPosition.bottom,
              showLegends: true,
              legendShape: BoxShape.circle,
              legendTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            chartValuesOptions: ChartValuesOptions(
              showChartValueBackground: true,
              showChartValues: true,
              showChartValuesInPercentage: false,
              showChartValuesOutside: false,
              decimalPlaces: 0,
            ),
          )
        ],
      ),
    ));
  }
}
