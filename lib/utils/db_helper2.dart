import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
class Db_helper2{
  Db_helper2._();
  static Db_helper2 db_helper2 = Db_helper2._();

  Database? database;

  Future<Database?> checkDB()async{
    if(database != null){
      return database;
    }
    else{
      return await creatDB();
    }
  }

  Future<Database> creatDB() async {
    Directory directory =await getApplicationDocumentsDirectory();
    String path = join(directory.path,'sum.db');
    return openDatabase(
        path,
        version: 1,
        onCreate: (db,version){
          String query = "CREATE TABLE std(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT, category_id INTEGER)";
          db.execute(query);
        }
    );
  }

  void insertDB({required String name, required int cate_id})async{
    database = await checkDB();

    database!.insert("std", {'name':name,'category_id' : cate_id});
  }

  Future<List<Map>> readDB()async{
    database = await checkDB();
    String query = "SELECT * FROM std";
    return  await database!.rawQuery(query);
  }

  void deleteDB({required int id})async{
    database = await checkDB();
    database!.delete("std",where: "id = ?",whereArgs: [id]);
  }

  void updateDB({required String name,required int id})async{
    database = await checkDB();
    database!.update("std", {'name':name},where: "id = ?",whereArgs: [id]);
  }

}