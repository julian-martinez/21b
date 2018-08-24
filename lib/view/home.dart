import 'package:flutter/material.dart';


import 'start.dart';
import 'profile.dart';
import 'explore.dart';
import 'post.dart';

import '../ui/home-bottom-nav.dart';

import 'package:fluttery/framing.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{

  int _currentIndex;

  final List<Widget> _children = [
    new Start(),
    new Explore(),
    new Post(),
    new Profile(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: new HomeBottomNav(
        index: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }

}
