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
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:midori/screens/learn_screen.dart';
import 'package:midori/screens/stats_screen.dart';
import 'package:midori/screens/test_screen.dart';
import 'package:midori/screens/about_screen.dart';
import 'package:midori/consts.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  bool isDarkModeEnabled = false;

  final prefs = GetStorage();
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      initialIndex: 1,
      length: 3,
    );

    isDarkModeEnabled = Get.isDarkMode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('緑 Midori'),
        bottom: TabBar(controller: _tabController, tabs: <Widget>[
          Tab(
            icon: Icon(Icons.book),
            text: 'LEARN',
          ),
          Tab(
            icon: Icon(Icons.rule),
            text: 'TEST',
          ),
          Tab(
            icon: Icon(Icons.timeline),
            text: 'STATS',
          ),
        ]),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'Donate', 'About'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          LearnScreen(),
          TestScreen(),
          StatsScreen(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.brightness_4_sharp),
        onPressed: () {
          Get.changeTheme(
              Get.isDarkMode ? Consts.lightTheme : Consts.darkTheme);
          setState(() {
            isDarkModeEnabled = Get.isDarkMode;
          });
          prefs.write("isDarkModeEnabled", !isDarkModeEnabled);
        },
      ),
    );
  }

  void handleClick(String value) {
    switch (value) {
      case 'Donate':
        break;
      case 'About':
        Navigator.pushNamed(
          context,
          AboutScreen.routeName,
        );
    }
  }
}
