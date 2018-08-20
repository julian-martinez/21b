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
    return new Container(
      decoration: new BoxDecoration(
        color: Colors.white
      ),
      child: new Stack(
        alignment: Alignment.center,
        children: <Widget>[
          new Text(widget.nick, textAlign: TextAlign.center,),
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

class Constants{
  static const String activate = 'Activar notificaciones de Post';
  static const String report = 'Reportar post';

  static const List<String> choices = <String>[
    activate, report
  ];
}


