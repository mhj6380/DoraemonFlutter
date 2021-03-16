import 'package:doraemon/example/exampleHelper.dart';
import 'package:doraemon/models/example/exampleInfo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SqlliteExample extends StatefulWidget {
  @override
  _SqlliteExampleState createState() => _SqlliteExampleState();
}

class _SqlliteExampleState extends State<SqlliteExample> {
  ExampleHelper _exampleHelper = ExampleHelper();

  @override
  void initState() {
    _exampleHelper.initializeDatabase().then((value) {
      print("-------------DATABASE initialized");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () async {
          DateTime now = DateTime.now();
          // String formattedDate = DateFormat('yyyy-MM-dd kk:mm:ss').format(now);
          // print(formattedDate);
          print(now);

          var exampleInfo = ExampleInfo(
              title: "제목임미당!",
              content: "내용임미당!", 
              createdAt: now,
              completed: 0);

          _exampleHelper.insertExample(exampleInfo);
        },
        child: Container(
          color: Colors.blue,
          padding: EdgeInsets.all(10),
          width: double.infinity,
          child: Text("Create"),
        ),
      ),
    );
  }
}
