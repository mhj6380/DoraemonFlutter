import 'package:flutter/material.dart';
import '../../globalfunction.dart';

class MainAppBar extends StatelessWidget {
  MainAppBar({this.title});

  final Widget title;
 
  @override 
  Widget build(BuildContext context) {
    return Container(
        height: 45.0,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(color: HexColor.fromHex("#ffffff")),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            title,
          ],
        ));
  }
}