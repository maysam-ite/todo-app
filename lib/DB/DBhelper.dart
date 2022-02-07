
// ignore_for_file: file_names

import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:todo/MVC/models.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';


class DBHelper{

  final String table = "tasks";

  Database? _database;
  static DBHelper _dbHelper = DBHelper._();

  DBHelper._();

  factory DBHelper(){
    return _dbHelper;
  }

  Future<Database> get database async {
    _database ??= await initializeDatabase();
    return _database!;
  }


  Future<Database> initializeDatabase() async {
    var dir = await getApplicationDocumentsDirectory();

    String path = dir.path + "tasks.db";

    var database = await openDatabase(
      path,
      version: 2,
      onCreate: (db, version) {

        db.execute('''
          create table if not exists $table ( 
          id integer primary key autoincrement, 
          title text not null,
          dateTime text not null
          )
        ''');
        print('created!!');
      },
    );

    print('DB init');
    return database;
  }

  Future<void> insertTask(TaskModel taskModel) async {
    var db = await this.database;
    var result = await db.insert(table, taskModel.toMap());
    print('result : $result');
  }

  Future<List<TaskModel>> getTasks() async {
    List<TaskModel> tasks = [];

    var db = await this.database;
    var result = await db.query(table);

    for(var m in result)
      tasks.add(TaskModel.map(m));


    return tasks;
  }

  Future<int> deleteTask(int id) async {
    var db = await this.database;
    return await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }




}
