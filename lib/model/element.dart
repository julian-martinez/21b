import 'comment.dart';
import 'point.dart';

class ElementItem {
  ElementItem(this.nick, this.dateTime, this.image, this.points, this.views, this.likes, this.liked, this.pictureComment, this.comments);

  final String nick;
  final DateTime dateTime;
  final String image;
  final int views;
  final int likes;
  final bool liked;
  final String pictureComment;
  final List<Comment> comments;
  final List<Point> points;
}