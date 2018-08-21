import 'package:flutter/material.dart';

class CardSocial extends StatefulWidget {
  CardSocial({Key key, @required this.views, @required this.likes, @required this.liked}) : super(key: key);

  final String views;
  final String likes;
  final bool liked;

  @override
  _CardSocialState createState() => _CardSocialState();
}

class _CardSocialState extends State<CardSocial> {

  bool _liked;

  @override
  void initState() {
    super.initState();
    _liked = widget.liked;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Stack(
        alignment: Alignment.center,
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.only(left: 16.0),
                child: new Row(
                  children: <Widget>[
                    new Text(widget.views),
                    new Icon(Icons.visibility, size: 16.0,)
                  ],
                ),
              ),
              new Container(
                padding: const EdgeInsets.only(left: 16.0),
                child: new Row(
                  children: <Widget>[
                    new Text(widget.likes),
                    new Icon(Icons.favorite, size: 16.0,)
                  ],
                ),
              ),
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new Container(
                child: new IconButton(
                    icon: getLikedIcon(_liked),
                    onPressed: (){
                      setState(() {
                        _liked = !_liked;
                      });
                    }
                ),
              ),
              new Container(
                child: new IconButton(
                    icon: new Icon(Icons.share),
                    onPressed: (){}
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


}

Icon getLikedIcon(bool liked){
  return liked ? new Icon(Icons.favorite) : new Icon(Icons.favorite_border);
}
