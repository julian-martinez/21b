import 'package:flutter/material.dart';
import 'dart:math';

class CardHeader extends StatefulWidget {
  CardHeader({Key key, @required this.nick, @required this.dateTime}) : super(key: key);

  final String nick;
  final DateTime dateTime;

  @override
  _CardHeaderState createState() => _CardHeaderState();
}

class _CardHeaderState extends State<CardHeader> {

  @override
  Widget build(BuildContext context) {
    Color _color = getRandomColor();

    return new Opacity(
      opacity: 0.9,
      child: new Container(
        decoration: new BoxDecoration(
            color: Colors.white
        ),
        child: new Stack(
          alignment: Alignment.center,
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new DrawCircle.small(
                  color: _color,
                  alignment: Alignment.centerRight,
                ),
                new Container(
                  padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                  child: new Text(widget.nick, textAlign: TextAlign.center,),
                ),
                new DrawCircle.small(
                  color: _color,
                  alignment: Alignment.centerLeft,
                ),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new Container(
                  child: new Text(
                      calculateDateTimeDifference(widget.dateTime)
                  ),
                ),
                new Container(
                  child: new PopupMenuButton<String>(
                      itemBuilder: (BuildContext context){
                        return ConstActions.choices.map((String choice){
                          return PopupMenuItem<String>(
                            value: choice,
                            child: new Text(choice),
                          );
                        }).toList();
                      }
                  ),
                ),
              ],
            ),
          ],
        ),
      )
    );

  }

  Color getRandomColor(){
    final _random = new Random();
    return ConstColors.choices[_random.nextInt(ConstColors.choices.length)];
  }

  String calculateDateTimeDifference(DateTime origin){
    int seconds = DateTime.now().difference(origin).inSeconds.abs();
    if (seconds < 60){
      return seconds.toString() + 's';
    } else if (seconds < 60*60){
      return (seconds/60).round().toString() + 'm';
    } else if (seconds < 60*60*24){
      return (seconds/(60*60)).round().toString() + 'h';
    } else if (seconds < 60*60*24*7){
      return (seconds/(60*60*24)).round().toString() + 'd';
    } else {
      return (seconds/(60*60*24*7)).round().toString() + 'w';
    }
  }
  
  
}


class DrawCircle extends StatelessWidget {
  DrawCircle({@required this.size, @required this.color, this.alignment});
  DrawCircle.small({@required this.color, this.size = 5.0, this.alignment});
  DrawCircle.big({@required this.color, this.size = 10.0, this.alignment});

  final double size;
  final Color color;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: alignment,
      decoration: new BoxDecoration(
          borderRadius: new BorderRadius.all(new Radius.circular(size)),
          border: new Border.all(
              color: color,
              width: size,
          )
      ),
    );
  }
}


class ConstColors{
  static const Color olive = Color.fromRGBO(154, 155, 118, 1.0);
  static const Color darkbeige = Color.fromRGBO(174, 156, 143, 1.0);
  static const Color beige = Color.fromRGBO(229, 216, 205, 1.0);
  static const Color ocre = Color.fromRGBO(236, 155, 49, 1.0);
  static const Color salmon = Color.fromRGBO(198, 116, 100, 1.0);
  static const Color blue = Color.fromRGBO(111, 137, 151, 1.0);
  static const Color darkblue = Color.fromRGBO(68, 83, 92, 1.0);
  static const Color red = Color.fromRGBO(165, 74, 83, 1.0);
  static const Color brown = Color.fromRGBO(91, 66, 61, 1.0);

  static const List<Color> choices = <Color>[
    olive, darkbeige, beige, ocre, salmon, blue, darkblue, red, brown
  ];
}


class ConstActions{
  static const String activate = 'Activar notificaciones de Post';
  static const String report = 'Reportar post';

  static const List<String> choices = <String>[
    activate, report
  ];
}


