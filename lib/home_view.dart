import 'package:flutter/material.dart';

import 'package:Midori/screens/learn_screen.dart';
import 'package:Midori/screens/stats_screen.dart';
import 'package:Midori/screens/test_screen.dart';

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
        actions: <Widget>[Icon(Icons.more_vert)],
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
