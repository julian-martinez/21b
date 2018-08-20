import 'package:flutter/material.dart';

class HomeBottomNav extends StatelessWidget {
  HomeBottomNav({@required this.index}) : super();

  final int index;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      type: BottomNavigationBarType.fixed,
      fixedColor: Colors.lightGreen,
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
            icon: new Icon(Icons.dashboard),
            title: new Text('Perfil')
        ),
      ],
    );
  }
}
