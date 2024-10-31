import 'package:sqflite/sqflite.dart';
import "package:path/path.dart";

class DataBaseSql {
  Database? _database;
  static const nameOfData = "Notes";

  Future<Database?> startData() async {
    var dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, nameOfData);
    return await openDatabase(path,
        version: 1,
        onCreate: (db, version) async => await db.execute(
            'CREATE TABLE Notes (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT)'));
  }

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await startData();
      return _database!;
    }
  }

  selectData(String sql) async {
    Database? myDataB = await database;
    List<Map> response = await myDataB.rawQuery(sql);
    return response;
  }

  Future insertData(Map<String, dynamic> notes) async {
    Database? myDataB = await database;
    return await myDataB.insert(nameOfData, notes);
  }

  upDateData(String sql) async {
    Database? myDataB = await database;
    int response = await myDataB.rawUpdate(sql);
    return response;
  }

  Future deleteData(id) async {
    Database? myDataB = await database;
    return myDataB.delete(nameOfData, where: 'id=?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> getAllNotes() async {
    Database? myDataB = await database;
    return await myDataB.query(nameOfData);
  }
}
