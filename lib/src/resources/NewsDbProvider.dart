import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import '../models/ItemModel.dart';
import 'Repository.dart';

class NewsDbProvider implements Source, Cache {
  Database db;

  NewsDbProvider() {
    init();
  }

  void init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, "Items.db");
    db = await openDatabase(path, version: 1,
        onCreate: (Database newDb, int version) {
      newDb.execute(""" 
      CREATE TABLE Items 
      (
        id INTEGER PRIMARY KEY,
        type TEXT,
        by TEXT,
        time INTEGER,
        text TEXT,
        parent INTEGER,
        kids BLOB,
        dead INTEGER,
        deleted INTEGER,
        url TEXT,
        score INTEGER,
        title TEXT,
        descendants INTEGER
      )""");
    });
  }

  @override
  Future<ItemModel> fetchItem(int id) async {
    final maps = await db.query(
      "Items",
      columns: null, //get all columns for a row
      where: "id = ?",
      whereArgs: [id],
    );
    if (maps.length > 0) {
      return ItemModel.fromDB(maps.first);
    }
    return null;
  }

  @override
  Future<int> addItem(ItemModel item) {
    return db.insert("Items", item.toMap()
    ,conflictAlgorithm: ConflictAlgorithm.ignore);
  }

  @override
  Future<List<int>> fetchTopIds() {
    // TODO: implement fetchTopIds
    return null;
  }
}

final newsDbProvider = NewsDbProvider();
