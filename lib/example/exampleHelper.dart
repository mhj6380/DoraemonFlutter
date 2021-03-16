import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import '../models/example/exampleInfo.dart';

// 모델타입 쉽게만들어주는 사이트!
// https://app.quicktype.io/

final String tableExample = 'example';
final String columnId = 'id';
final String columnTitle = 'title';
final String columnContent = 'content';
final String columnCreatedAt = 'createdAt';
final String columnCompleted = 'completed';

class ExampleHelper {
  static Database _database;
  static ExampleHelper _exampleHelper;

  ExampleHelper._createInstance();
  factory ExampleHelper() {
    if (_exampleHelper == null) {
      _exampleHelper = ExampleHelper._createInstance();
    }
    return _exampleHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    var dir = await getDatabasesPath();
    var path = dir + "example.db";
    var database = await openDatabase(path,
        version: 1,
        onCreate: (db, version) => {
              db.execute('''
        create table $tableExample (
          $columnId integer primary key autoincrement,
          $columnTitle text not null,
          $columnContent text not null,
          $columnCreatedAt datetime,
          $columnCompleted INTEGER
        )      
      ''')
            });

    return database;
  }

  // CRUD

  // Create
  void insertExample(ExampleInfo exampleInfo) async {
    var db = await this.database;
    var result = await db.insert(tableExample, exampleInfo.toJson());
    print('result : $result');
  }
}
