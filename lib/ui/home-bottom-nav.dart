import 'package:flutter/material.dart';
import 'card-header.dart';
import 'package:fluttery/framing.dart';

class HomeBottomNav extends StatelessWidget {
  HomeBottomNav({@required this.index, this.onTap}) : super();

  final int index;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      currentIndex: index,
      type: BottomNavigationBarType.fixed,
      fixedColor: Theme.of(context).accentColor,
      items: [
        BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Inicio'),
        ),
        BottomNavigationBarItem(
            icon: new Icon(Icons.search),
            title: new Text('Explorar')
        ),
        BottomNavigationBarItem(
            icon: new Icon(Icons.camera_alt),
            title: new Text('Publicar')
        ),
        BottomNavigationBarItem(
            icon: new Container(
              child: new Stack(
                children: <Widget>[
                  new Icon(Icons.dashboard),
                  new Positioned(
                    left: 16.0,
                    child: new DrawCircle.small(
                      borderColor: Colors.white,
                    ),
                  ),
                  new Positioned(
                    left: 18.0,
                    top: 2.0,
                    child: new DrawCircle.mini(
                      borderColor: Theme.of(context).accentColor,
                    ),
                  ),
                ],
              ),
            ),

            title: new Text('Perfil')
        ),
      ],
    );
  }
}
