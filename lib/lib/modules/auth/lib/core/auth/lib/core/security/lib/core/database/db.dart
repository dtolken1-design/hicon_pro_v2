import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  static Future<Database> _initDB() async {
    final path = join(await getDatabasesPath(), 'hicon_pro.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {

        await db.execute('''
          CREATE TABLE jobs (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            customer TEXT,
            status TEXT,
            price REAL,
            cost REAL,
            profit REAL,
            assignedTo TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE photos (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            jobId INTEGER,
            path TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE reports (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            date TEXT,
            data TEXT
          )
        ''');
      },
    );
  }
}
