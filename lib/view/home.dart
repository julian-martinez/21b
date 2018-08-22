import 'package:flutter/material.dart';

import '../ui/appbar.dart';
import '../ui/card.dart';
import '../ui/card-header.dart';
import '../ui/home-bottom-nav.dart';

import '../model/comment.dart';
import '../model/element.dart';
import '../model/point.dart';

import 'package:sticky_headers/sticky_headers.dart';
import 'package:fluttery/framing.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {


    return new Scaffold(
      body: new NestedScrollView(
          headerSliverBuilder: (BuildContext ctx, bool scrolledBox) {
            return <Widget>[];
          },
          body: new CustomScrollView(
            slivers: <Widget>[
              new CustomAppBar().build(),
              new SliverList(
                delegate: new SliverChildBuilderDelegate((BuildContext contx, int index) {
                  return new Container(
                    child: new StickyHeader(
                      overlapHeaders: false,
                      header: new Container(
                        child: new CardHeader(
                            nick: elements[index].nick,
                            dateTime: elements[index].dateTime),
                      ),
                      content: new Container(
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            new CardBody(
                              asset: elements[index].image,
                              points: elements[index].points,
                              views: elements[index].views,
                              likes: elements[index].likes,
                              liked: elements[index].liked,
                              pictureComment: elements[index].pictureComment,
                              comments: elements[index].comments,
                            ),
                          ],
                        ),
                      ),
                  ));
                }, childCount: elements.length),
              )
            ],
          )),
      bottomNavigationBar: new HomeBottomNav(index: 0)
    );
  }
}

List<ElementItem> elements = [
  new ElementItem('axelmod', DateTime.parse("2018-08-20 11:03:13Z"), 'assets/chico-4.jpg', points, 55, 8, false, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor', mockComments),
  new ElementItem('angelkiss', DateTime.parse("2018-08-20 10:29:43Z"), 'assets/chica-4.jpg', [], 55, 8, false, 'Lorem ipsum', mockComments),
  new ElementItem('oroalera', DateTime.parse("2018-08-19 11:00:00Z"), 'assets/chica-3.jpg', [], 55, 8, false, '', mockComments),
  new ElementItem('jisasfist', DateTime.parse("2018-08-01 13:00:00Z"), 'assets/chico-3.jpg', [], 55, 8, false, '', mockComments)
];

List<Point> points = [
  new Point(40.0, 55.0, 1),
  new Point(32.0, 35.0, 2),
  new Point(45.0, 92.0, 3),
];

List<Comment> mockComments = <Comment>[
  Comment('Nick1', 'Texto de prueba'),
  Comment('Nick2',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'),
];
