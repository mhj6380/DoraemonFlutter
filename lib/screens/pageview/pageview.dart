import 'package:flutter/material.dart';

class ManyPageView extends StatelessWidget {

  final controller = PageController(initialPage:1);


  @override 
  Widget build(BuildContext context) { 
 
 
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar( 
            title: Text("Tab demo"),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                    child: Column(children: <Widget>[
                  Icon(Icons.directions_car),
                  Text("car")
                ])),
                Tab(icon: Icon(Icons.directions_transit), text: "transit"),
                Tab(icon: Icon(Icons.directions_bike), text: "bike")
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike))
            ],
          ),
        ),
      );

  }
}


class Sample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("PAGE1"),
    );
  }
}