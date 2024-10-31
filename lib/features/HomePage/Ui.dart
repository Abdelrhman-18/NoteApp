import 'package:flutter/material.dart';
import 'package:noteapp/core/ColorsName.dart';

import 'package:noteapp/features/HomePage/Homebody.dart';
import 'package:noteapp/features/personPage/ui.dart';

import '../../core/databasessqlf.dart';
import '../../core/textfiledwidget.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selectedIndex = 0;
  @override

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List<Widget> pageList = [
    const Homebody(),
    const personPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: "Calendar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Person",
          ),
        ],
      ),

      body: pageList[selectedIndex],
    );
  }
}
