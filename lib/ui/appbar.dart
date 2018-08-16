import 'package:flutter/material.dart';

class CustomAppBar {
  PreferredSizeWidget build() {
    return new AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: new RichText(
        //textAlign: TextAlign.center,
        text: new TextSpan(
            style: new TextStyle(
                fontSize: 16.0,
                color: Colors.black
            ),
            children: <TextSpan>[
              new TextSpan(
                  text: '21',
                  style: new TextStyle(
                      fontWeight: FontWeight.w600,
                      letterSpacing: 6.0
                  )
              ),
              new TextSpan(
                  text: 'BUTTONS',
                  style: new TextStyle(
                    letterSpacing: 6.0,
                  )
              ),
            ]
        ),
      ),
      actions: <Widget>[
        new IconButton(
            icon: new Icon(Icons.person_add),
            onPressed: null
        )
      ],
    );
  }
}

