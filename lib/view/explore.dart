import 'package:flutter/material.dart';

import 'search-looks.dart';
import 'search-buttoners.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: new PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: new SafeArea(
              child: new TabBar(
                tabs: [
                  new Tab(
                    child: new Text('LOOKS',
                        style: new TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 3.0
                        )
                    )
                  ),
                  new Tab(
                      child: new Text('BUTTONERS',
                          style: new TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 3.0
                          )
                      )
                  ),
                  //new Tab(text: 'LOOKS'),
                  //new Tab(text: 'BUTTONERS')
                ],
              ),
          ),
        ),
        body: TabBarView(
          children: [
            new SearchLooks(),
            new SearchButtoners(),
          ],
        ),
      ),
    );
  }
}
