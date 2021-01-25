import 'package:flutter/material.dart';

import 'package:Midori/home_view.dart';

void main() => runApp(Midori());

class Midori extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Midori',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
