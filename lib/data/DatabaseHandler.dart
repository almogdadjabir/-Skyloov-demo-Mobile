import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../screens/home/data/models/properties.dart';


class DatabaseHandler {

  DatabaseHandler(){
    initializeDB();
  }
  Future<Database> initializeDB() async {
    print('initializeDB : called');
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'skyloov.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE Properties("
              "_id TEXT , "
              "title TEXT NOT NULL,"
              "imageURL TEXT NOT NULL, "
              "location TEXT NOT NULL, "
              "price TEXT, "
              "distance TEXT, "
              "type INTEGER, "
              "bedroom INTEGER, "
              "bathroom INTEGER, "
              "description TEXT,"
              "emirate TEXT)",
        );

      },
      version: 1,
    );
  }


  Future<int> insertProperties(Properties property) async {
    int result = 0;
    final Database db = await initializeDB();
      result = await db.insert('Properties', property.toJson());
    print('result: $result');
    return result;
  }

  Future<List<Properties>> retrieveProperties() async {
    print("retrieveProperties called");

    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('Properties', orderBy: "_id DESC",);
    return queryResult.map((e) => Properties.fromJson(e)).toList().reversed.toList();
  }

  Future<void> deleteProperties(String id) async {
    final db = await initializeDB();
    await db.delete(
      'Properties',
      where: "_id = ?",
      whereArgs: [id],
    );
  }

}
