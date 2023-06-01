// ignore: unused_import
import 'dart:io';

// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
// ignore: unused_import
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static const _databaseName = "fatecflix.db";
  static const _databaseVersion = 1;

  static const table = 'usuario';

  static const columnId = 'id';
  static const columnNome = 'nome';
  static const columnSobrenome = 'sobrenome';
  static const columnEmail = 'email';
  static const columnRa = 'ra';
  static const columnCpf = 'cpf';
  static const columnDataNascimento = 'nascimento';
  static const columnCurso = 'curso';
  static const columnAnoIngresso = 'anoIngresso';
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
            $columnRa TEXT NOT NULL,
            $columnCpf TEXT NOT NULL,
            $columnDataNascimento TEXT NOT NULL,
            $columnCurso TEXT NOT NULL,
            $columnAnoIngresso TEXT NOT NULL,
            $columnPeriodo TEXT NOT NULL,
            $columnSenha TEXT NOT NULL
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

  Future<List<Map<String, dynamic>>> queryRows(id) async {
    Database? db = await instance.database;
    return await db!.query(table, where: "$columnId LIKE '%$id%'");
  }

  //login
  Future<List<Map<String, dynamic>>> queryRowsLogin(email) async {
    Database? db = await instance.database;
    return await db!.query(table, where: "$columnEmail LIKE '%$email%'");
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

  //Inicializando a database
}
