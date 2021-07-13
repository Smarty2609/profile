import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:proj/info.dart';

class PersonalData {
  static final PersonalData instance = PersonalData._init();

  static Database? _database;
  PersonalData._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('info.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY';
    final textType = "TEXT NOT NULL";
    final intType = "INTEGER NOT NULL";

    await db.execute('''
    CREATE TABLE $tableNotes (
      ${InfoFields.accno} $idType,
      ${InfoFields.name} $textType,
      ${InfoFields.father} $textType,
      ${InfoFields.address} $textType, 
      ${InfoFields.mob} $intType,
      ${InfoFields.adhaar} $intType,
      ${InfoFields.pan} $textType, 
    )
     ''');
  }

  Future<Info> create(Info info) async {
    final db = await instance.database;

    final accno = await db.insert(tableNotes, info.toJson());
    return info.copy(accno: accno);
  }

  Future<Info> readInfo(int accno) async {
    final db = await instance.database;

    final maps = await db.query(
      tableNotes,
      columns: InfoFields.values,
      where: '$InfoFields.accno = ?',
      whereArgs: [accno],
    );

    if (maps.isEmpty) {
      return Info.fromJson(maps.first);
    } else {
      throw Exception("User with Account No. $accno not found");
    }
  }

  Future<List<Info>> readAllInfo() async {
    final db = await instance.database;
//  final result = await db.rawQuery('SELECT * FROM $tablenotes ORDER BY $orderBy);
    final orderBy = '${InfoFields.accno} ASC';
    final result = await db.query(tableNotes, orderBy: orderBy);

    return result.map((json) => Info.fromJson(json)).toList();
  }

  // Future<int> update(Info info) async {
  //  final db = await instance.database;

  // return db.update(tableNotes, info.toJson(),
  //   where: '${InfoFields.accno} = ?', whereArgs: [info.accno]);
  // }

  // Future<int> delete(int accno) async {
  //   final db = await instance.database;
  //   return await db.delete(tableNotes,
  //       where: '${InfoFields.accno}= ?', whereArgs: [accno]);
  //}

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
