import 'package:flutter/material.dart';

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
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                ),
                new Container(
                  padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                  child: new Text(widget.nick, textAlign: TextAlign.center,),
                ),
                new DrawCircle.small(
                  color: Colors.red,
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
                        return Constants.choices.map((String choice){
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


class Constants{
  static const String activate = 'Activar notificaciones de Post';
  static const String report = 'Reportar post';

  static const List<String> choices = <String>[
    activate, report
  ];
}


