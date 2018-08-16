import 'package:flutter/material.dart';

import '../ui/card.dart';
import '../model/comment.dart';

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
          new CardElement(
            nick: 'axelmod',
            dateTime: DateTime.now(),
            asset: 'assets/chico-4.jpg',
            views: 55,
            likes: 8,
            liked: false,
            comments: mockComments,
          ),
          new CardElement(
            nick: 'angelkiss',
            dateTime: DateTime.now(),
            asset: 'assets/chica-4.jpg',
            views: 85,
            likes: 12,
            liked: true,
            comments: mockComments,
          ),
          new CardElement(
            nick: 'oroalera',
            dateTime: DateTime.now(),
            asset: 'assets/chica-3.jpg',
            views: 31,
            likes: 5,
            liked: false,
            comments: mockComments,
          ),
          new CardElement(
            nick: 'jisasfist',
            dateTime: DateTime.now(),
            asset: 'assets/chico-3.jpg',
            views: 34,
            likes: 4,
            liked: false,
            comments: mockComments,
          ),
        ],
      ),
    );
  }
}

List<Comment> mockComments = <Comment>[
  Comment('Nick1', 'Texto de prueba'),
  Comment('Nick2', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'),
];

