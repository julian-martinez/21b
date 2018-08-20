import 'package:flutter/material.dart';

import '../ui/appbar.dart';
import '../ui/card.dart';
import '../ui/card-header.dart';
import '../ui/card-picture.dart';
import '../ui/card-social.dart';
import '../ui/card-comments.dart';
import '../ui/home-bottom-nav.dart';

import '../model/comment.dart';
import '../model/element.dart';

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
    List<ElementItem> elements() => [
      new ElementItem('axelmod', DateTime.now(), 'assets/chico-4.jpg', 55, 8, false, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor', mockComments),
      new ElementItem('angelkiss', DateTime.now(), 'assets/chica-4.jpg', 55, 8, false, 'Lorem ipsum', mockComments),
      new ElementItem('oroalera', DateTime.now(), 'assets/chica-3.jpg', 55, 8, false, '', mockComments),
      new ElementItem('jisasfist', DateTime.now(), 'assets/chico-3.jpg', 55, 8, false, '', mockComments)
    ];

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
                            nick: elements()[index].nick,
                            dateTime: elements()[index].dateTime),
                      ),
                      content: new Container(
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            new CardBody(
                              asset: elements()[index].image,
                              views: elements()[index].views,
                              likes: elements()[index].likes,
                              liked: elements()[index].liked,
                              pictureComment: elements()[index].pictureComment,
                              comments: elements()[index].comments,
                            ),
                          ],
                        ),
                      ),
                  ));
                }, childCount: elements().length),
              )
            ],
          )),
      bottomNavigationBar: new HomeBottomNav(index: 0)
    );
  }
}

List<Widget> singleList(List<ElementItem> elements) {
  List<Widget> list = <Widget>[
    new SingleChildScrollView(
      child: new ListView.builder(itemBuilder: (context, index) {
        return new StickyHeader(
          header: new Container(
            child: new CardHeader(
                nick: elements[index].nick, dateTime: elements[index].dateTime),
          ),
          content: new Container(
            child: new Column(
              children: <Widget>[
                new CardPicture(picturePath: elements[index].image),
                new CardSocial(
                    views: elements[index].views.toString(),
                    likes: elements[index].likes.toString(),
                    liked: elements[index].liked),
                new CardComments(
                  comments: elements[index].comments,
                )
              ],
            ),
          ),
        );
      }),
    )
  ];
  return list;
}

List<Comment> mockComments = <Comment>[
  Comment('Nick1', 'Texto de prueba'),
  Comment('Nick2',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'),
];
