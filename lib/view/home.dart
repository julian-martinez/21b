import 'package:flutter/material.dart';

import '../ui/card-header.dart';
import '../ui/card-picture.dart';
import '../ui/card-social.dart';
import '../ui/card-comments.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
      child: new Column(
        children: <Widget>[
          new CardHeader(
              dateTime: DateTime.now()
          ),
          new CardPicture(),
          new CardSocial(
              views: '55',
              likes: '8',
              liked: false
          ),
          new CardComments()
        ],
      ),
    );
  }
}

