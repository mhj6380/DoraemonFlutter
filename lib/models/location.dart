import 'location_fact.dart';

class Location {
  String name;
  String imagePath;
  final List<LocationFact> facts;

  Location(this.name, this.imagePath, this.facts);

  static List<Location> fetchAll(){
    return [
      Location('test1', 'assets/images/kiyomizu-dera.jpg',[
        LocationFact('summery', 'hahahahahah'),
        LocationFact('summery', 'hahahahahah')
      ])
    ];
  }
} 