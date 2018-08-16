import 'package:flutter/material.dart';
import 'ui/appbar.dart';
import 'view/home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        backgroundColor: Colors.white,
        //appBar: CustomAppBar().build(),
        body: new Home(title: 'Home'),
      )
    );
  }
}

