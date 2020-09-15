import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:covid19/pages/country.dart';
import 'package:covid19/pages/dashborad.dart';

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class BottomNavBarCOVID extends StatefulWidget {
  @override
  _BottomNavBarCOVIDState createState() => _BottomNavBarCOVIDState();
}

class _BottomNavBarCOVIDState extends State<BottomNavBarCOVID> {
  int _currentindex = 0;
  final List<Widget> _children = [
    DashBoard(),
    CountryPage(),
  ];

  void ontappedbar(int index) {
    setState(() {
      _currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Colors.black,
        selectedIndex: _currentindex,
        showElevation: true,
        itemCornerRadius: 8,
        curve: Curves.easeInBack,
        onItemSelected: (index) => setState(() {
          _currentindex = index;
        }),
        items: [
          BottomNavyBarItem(
            icon: Icon(LineIcons.home),
            title: Text('dashborad'),
            activeColor: Colors.pink,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(LineIcons.info),
            title: Text('Country'),
            activeColor: Colors.pink,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      body: _children[_currentindex],
    );
  }
}
