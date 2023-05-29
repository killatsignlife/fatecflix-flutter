import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static const _databaseName = "fatecflix.db";
  static const _databaseVersion = 1;

  static const table = 'usuario';

  static const columnId = '_id';
  static const columnNome = 'nome';
  static const columnSobrenome = 'sobrenome';
  static const columnEmail = 'email';
  static const columnRa = 'ra';
  static const columnCpf = 'cpf';
  static const columnDataNascimento = 'nascimento';
  static const columnCurso = 'curso';
  static const columnAnoIngresso = 'ano';
  static const columnPeriodo = 'periodo';
  static const columnSenha = 'senha';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {

    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnNome TEXT NOT NULL,
            $columnSobrenome TEXT NOT NULL,
            $columnEmail TEXT NOT NULL,
            $columnRa INTEGER NOT NULL,
            $columnCpf INT NOT NULL,
            $columnDataNascimento TEXT NOT NULL,
            $columnCurso INT NOT NULL,
            $columnAnoIngresso INT NOT NULL,
            $columnPeriodo INT NOT NULL,
            $columnSenha INT NOT NULL
          )
          ''');
  }

  // CRUDDO
  // Create
  Future<int?> insert(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db!.insert(table, row);
  }

  // Read
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database? db = await instance.database;

    return await db!.query(table);
  }

  Future<int?> queryRowCount() async {
    Database? db = await instance.database;

    return Sqflite.firstIntValue(
        await db!.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  // Update
  Future<int> update(Map<String, dynamic> row) async {
    Database? db = await instance.database;

    int id = row[columnId];

    return await db!
        .update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }

  // DELETE
  Future<int> delete(int id) async {
    Database? db = await instance.database;

    return await db!.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }
}
