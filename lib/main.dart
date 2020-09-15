import 'package:covid19/Widget/nav%20bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'COvid19',
      debugShowCheckedModeBanner: false,
      home: BottomNavBarCOVID(),
    );
  }
}
