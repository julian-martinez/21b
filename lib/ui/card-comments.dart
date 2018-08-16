import 'package:flutter/material.dart';

class CardComments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.all(16.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Comment(
              author: 'Nick1',
              comment: 'Texto de prueba'
          ),
          new Comment(
              author: 'Nick2',
              comment: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'
          ),
          new GestureDetector(
            onTap: (){
              print('Container clicked');
            },
            child: new Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: new Text('+ Añadir comentario'),
            ),
          )
        ],
      ),
    );
  }
}

class Comment extends StatelessWidget {
  Comment({Key key, @required this.author, @required this.comment}): super(key: key);

  final String author;
  final String comment;

  final String separator = ':';
  GlobalKey stickyKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: new Text(author + separator,
              style: new TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          new Expanded(
            child: new Text(comment,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}


