import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:async';

import 'card-header.dart';
import '../model/point.dart';
import 'package:fluttery/framing.dart';

class CardPicture extends StatelessWidget {
  CardPicture({@required this.picturePath, this.points});

  final String picturePath;
  final List<Point> points;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      child: new FutureBuilder<ui.Image>(
        future: _getImage(picturePath),
        builder: (BuildContext context, AsyncSnapshot<ui.Image> snapshot) {
          if (snapshot.hasData) {
            ui.Image image = snapshot.data;
            return new AspectRatio(
              aspectRatio: image.width.roundToDouble()/image.height.roundToDouble(),
              child: new Stack(
                children: _pictureStack(screenWidth, image.width, image.height),
              ),
            );
          } else {
            return new Text('Loading...');
          }
        },
      ),
    );
  }


  List<Widget> _pictureStack(double screenWidth, int width, int height){
    List<Widget> list = new List();
    list.add(new Image.asset(picturePath));
    //calculate points position
    double reduction = screenWidth/width;
    for(Point p in points){
      list.add(
        new Positioned(
          top: (height * reduction) * (p.relativeY) - 5.0,
          left: (width * reduction) * (p.relativeX) - 5.0,
          child: new DrawCircle.big(borderColor: ConstColors().randomColor)
        ),
      );

    }
    return list;
  }

}

Future<ui.Image> _getImage(String picturePath){
  Completer<ui.Image> completer = new Completer<ui.Image>();
  new AssetImage(picturePath)
      .resolve(new ImageConfiguration())
      .addListener((ImageInfo info, bool _) => completer.complete(info.image));
  return completer.future;
}

class PictureComment extends StatelessWidget {
  PictureComment({this.pictureComment});

  final String pictureComment;

  @override
  Widget build(BuildContext context) {
    if (pictureComment != null && pictureComment != ''){
      return Container(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Expanded(
              child: new Text(pictureComment,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey
                ),
              ),
            ),
          ],
        ),
      );
    } else return new Container();
  }
}

