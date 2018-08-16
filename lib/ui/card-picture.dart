import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:async';

class CardPicture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new FutureBuilder<ui.Image>(
        future: _getImage(),
        builder: (BuildContext context, AsyncSnapshot<ui.Image> snapshot) {
          if (snapshot.hasData) {
            ui.Image image = snapshot.data;
            return new Stack(
              children: <Widget>[
                new AspectRatio(
                  aspectRatio: _validAspectRatioImage(image.width, image.height),
                  child: new Image.asset('assets/chico-4.jpg'),
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

Future<ui.Image> _getImage(){
  Completer<ui.Image> completer = new Completer<ui.Image>();
  new AssetImage('assets/chico-4.jpg')
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
