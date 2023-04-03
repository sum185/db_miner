import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
class Db_Helper
{
  Db_Helper._();
  static Db_Helper db_helper = Db_Helper._();

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
   String path = join(directory.path,'rnw.db');
   return openDatabase(
     path,
     version: 1,
     onCreate: (db,version){
       String query = "CREATE TABLE category(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT)";
       db.execute(query);
     }
   );
 }

 void insertDB({required String name})async{
    database = await checkDB();

    database!.insert("category", {'name':name});
 }

 Future<List<Map>> readDB()async{
    database = await checkDB();
    String query = "SELECT * FROM category";
    return  await database!.rawQuery(query,null);
 }
 void deleteDB({required int id})async{
    database = await checkDB();
    database!.delete("category",where: "id = ?",whereArgs: [id]);
 }

 void updateDB({required String name,required int id})async{
    database = await checkDB();
    database!.update("category", {'name':name},where: "id = ?",whereArgs: [id]);
 }



}