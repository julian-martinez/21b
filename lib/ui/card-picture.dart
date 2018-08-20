import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:async';

import 'package:fluttery/framing.dart';

class CardPicture extends StatelessWidget {
  CardPicture({@required this.picturePath});

  final String picturePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new FutureBuilder<ui.Image>(
        future: _getImage(picturePath),
        builder: (BuildContext context, AsyncSnapshot<ui.Image> snapshot) {
          if (snapshot.hasData) {
            ui.Image image = snapshot.data;
            return new Stack(
              children: <Widget>[
                new AspectRatio(
                  aspectRatio: _validAspectRatioImage(image.width, image.height),
                  child: new Image.asset(picturePath),
                )
              ],
            );
          } else {
            return new Text('Loading...');
          }
        },
      ),
    );
  }
}

Future<ui.Image> _getImage(String picturePath){
  Completer<ui.Image> completer = new Completer<ui.Image>();
  new AssetImage(picturePath)
      .resolve(new ImageConfiguration())
      .addListener((ImageInfo info, bool _) => completer.complete(info.image));
  return completer.future;
}

double _validAspectRatioImage(int width, int height){
  double image = width.roundToDouble()/height.roundToDouble();
  if (image < 0.5625) return 0.5625;
  else if (image > 1.0) return 1.0;
  else return image;
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

