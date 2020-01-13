import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:rss_feed/modal_class/news.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;

  String newsTable = 'news_table';
  String colId = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String colUrlImage = 'urlImage';
  String colUrlPost = 'urlPost';
  String colDate = 'date';

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper
          ._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'news_feed.db';

    var notesDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return notesDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $newsTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, '
        '$colDescription TEXT, $colUrlImage TEXT, $colUrlPost TEXT,$colDate TEXT)');
  }

  Future<List<Map<String, dynamic>>> getNewsMapList() async {
    Database db = await this.database;

    var result = await db.query(newsTable);
    return result;
  }

  Future<int> insertNews(News news) async {
    Database db = await this.database;
    var result = await db.insert(newsTable, news.toMap());
    return result;
  }

  Future<List<News>> getNewsList() async {
    var noteMapList = await getNewsMapList();
    int count = 10;

    List<News> newsList = List<News>();
    for (int i = 0; i < count; i++) {
      newsList.add(News.fromMapObject(noteMapList[i]));
    }

    return newsList;
  }
}
