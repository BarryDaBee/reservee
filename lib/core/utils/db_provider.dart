import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();
  static Database? _database;

  Future<Database> get database async {
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    if (_database != null) {
      return _database!;
    } else {
      return await openDatabase(
        join(await getDatabasesPath(), 'database.db'),
        version: 1,
        onCreate: (Database db, int version) async {
          await db.execute('''
             CREATE TABLE IF NOT EXISTS User(
              username TEXT PRIMARY KEY,
              password TEXT,
             )
          ''');
        },
      );
    }
  }

  void newUser() async {
    final db = await database;
    var res = await db.rawInsert(
      '''
          INSERT INTO User(
             username, password
          ) VALUES(?,?)
        ''',
      ['Jide', 'James'],
    );
  }
}
