import 'package:flutter/material.dart';
import 'ui/appbar.dart';
import 'view/home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: _theme,
      home: new Scaffold(
        backgroundColor: Colors.white,
        body: new Home(title: 'Home'),
      )
    );
  }
}

final ThemeData _theme = new ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.lightGreen,
    accentColor: Colors.orange,
    textTheme: new TextTheme(
      body1: new TextStyle(
          fontSize: 16.0
      ),
    )
);

