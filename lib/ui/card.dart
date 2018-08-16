import 'package:flutter/material.dart';

import '../ui/card-header.dart';
import '../ui/card-picture.dart';
import '../ui/card-social.dart';
import '../ui/card-comments.dart';

import '../model/comment.dart';

class CardElement extends StatefulWidget {
  CardElement({Key key, @required this.nick, @required this.dateTime, @required this.asset, @required this.views, @required this.likes, @required this.liked, this.comments}): super(key: key);

  final String nick;
  final DateTime dateTime;
  final String asset;
  int views;
  int likes;
  bool liked;
  List<Comment> comments;

  @override
  _CardElementState createState() => _CardElementState();
}

class _CardElementState extends State<CardElement> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Column(
        children: <Widget>[
          new CardHeader(
            nick: widget.nick,
            dateTime: widget.dateTime
          ),
          new CardPicture(
            picturePath: widget.asset
          ),
          new CardSocial(
            views: widget.views.toString(),
            likes: widget.likes.toString(),
            liked: widget.liked
          ),
          new CardComments(
            comments: widget.comments,
          )
        ],
      ),
    );
  }
}
