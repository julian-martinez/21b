import 'package:flutter/material.dart';

import '../ui/card-header.dart';
import '../ui/card-picture.dart';
import '../ui/card-social.dart';
import '../ui/card-comments.dart';

import '../model/comment.dart';
import '../model/point.dart';

class CardBody extends StatefulWidget {
  CardBody({Key key, @required this.asset, this.points, @required this.views, @required this.likes, @required this.liked, this.pictureComment, this.comments}): super(key: key);

  final String asset;
  final List<Point> points;
  int views;
  int likes;
  bool liked;
  final String pictureComment;
  List<Comment> comments;

  @override
  _CardBodyState createState() => _CardBodyState();
}

class _CardBodyState extends State<CardBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
          color: Colors.white
      ),
      child: new Column(
        children: <Widget>[
          new CardPicture(
            picturePath: widget.asset,
            points: widget.points,
          ),
          new CardSocial(
            views: widget.views.toString(),
            likes: widget.likes.toString(),
            liked: widget.liked
          ),
          new PictureComment(
            pictureComment: widget.pictureComment,
          ),
          new CardComments(
            comments: widget.comments,
          )
        ],
      ),
    );
  }
}
