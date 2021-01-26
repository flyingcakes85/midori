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

import 'package:Midori/screens/learn_screen.dart';
import 'package:Midori/screens/stats_screen.dart';
import 'package:Midori/screens/test_screen.dart';
import 'package:Midori/screens/about_screen.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      initialIndex: 1,
      length: 3,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('緑 Midori'),
        elevation: 1,
        bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.white,
            tabs: <Widget>[
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
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () => {
              Navigator.pushNamed(
                context,
                AboutScreen.routeName,
              )
            },
          )
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
    );
  }
}
