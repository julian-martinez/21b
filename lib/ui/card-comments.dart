import 'package:flutter/material.dart';
import '../model/comment.dart';

class CardComments extends StatelessWidget {
  CardComments({this.comments});

  List<Comment> comments;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.all(16.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _getComments()
      ),
    );
  }

  List<Widget> _getComments(){
    List<Widget> commentList = new List();
    if (comments != null) {
      comments.forEach((element) =>
          commentList.add(new CommentWidget(
              author: element.author, comment: element.comment)
          ));
    }
    commentList.add(_addNewComment());
    return commentList;
  }

  Widget _addNewComment(){
    return new GestureDetector(
      onTap: (){
        print('Container clicked');
      },
      child: new Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: new Text('+ Añadir comentario'),
      ),
    );
  }

}

class CommentWidget extends StatelessWidget {
  CommentWidget({Key key, @required this.author, @required this.comment}): super(key: key);

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


