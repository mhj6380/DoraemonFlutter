import 'package:flutter/material.dart';
import '../models/location.dart';

class LocationDetail extends StatelessWidget{
  @override
  Widget build(BuildContext context){

    final locations = Location.fetchAll();
    final location = locations.first;

    return Scaffold(
      appBar: AppBar(
        title: Text(location.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("ImagePath : "),
          Text(location.imagePath)
        ]..addAll(textSections(location)),
      )
    );
  }

  List<Widget> textSections(Location location){
   return location.facts.map((fact) => Container(child: Row(children: [Text(fact.title), Text("::"),Text(fact.text)],))).toList();
  }
}