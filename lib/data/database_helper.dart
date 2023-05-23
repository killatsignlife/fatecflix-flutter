import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import '../model/student.dart';

class DatabaseHelper {
  static const _databaseName = "fatecflixDb.db";
  static const _databaseVersion = 1;

  static const table = 'aluno';
  static const columnId = '_id';
  static const columnNome = 'nome';
  static const columnSobrenome = 'sobrenome';
  static const columnRa = 'ra';
  static const columnCpf = 'cpf';
  static const columnDataNascimento = 'dataNascimento';
  static const columnEmail = 'email';
  static const columnCurso = 'curso';
  static const columnAnoIngresso = 'anoIngresso';
  static const columnSemestre = 'semestre';
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

    return await openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnNome TEXT NOT NULL,
            $columnRa INTEGER NOT NULL,
            $columnCpf INTEGER NOT NULL,
            $columnEmail TEXT NOT NULL,
            $columnAnoIngresso INTEGER NOT NULL,
            $columnCurso TEXT NOT NULL,
            $columnSemestre INT NOT NULL,
            $columnSenha TEXT NOT NULL
          )
          ''');
  } 


  // CRUDDO
  // Create
  Future<int?> insert(Student student) async {
    Database? db = await instance.database;

    return await db?.insert(table, { 
      'nome': student.nome, 
      'ra': student.ra,
      'cpf': student.cpf,
      'email': student.email,
      'anoIngresso': student.anoIngresso,
      'curso': student.curso,
      'semestre': student.periodo,
      'senha': student.senha  
    });
  }

  // Read
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database? db = await instance.database;

    return await db!.query(table);
  }

  Future<List<Map<String, dynamic>>> queryRows(ra) async {
    Database? db = await instance.database;
    return await db!.query(table, where: "$columnRa LIKE '%$ra%'");
  } 

  Future<int?> queryRowCount() async {
    Database? db = await instance.database;

    return Sqflite.firstIntValue(
      await db!.rawQuery('SELECT COUNT(*) FROM $table')
    );
  }

  // Update
  Future<int> update(Student student) async {
    Database? db = await instance.database;

    int id = student.toMap()['id'];

    return await db!.update(
      table, 
      student.toMap(), 
      where: '$columnId = ?', whereArgs: [id]
    );
  }

  // DELETE
  Future<int> delete(int id) async {
    Database? db = await instance.database;

    return await db!.delete(
      table,
      where: '$columnId = ?',
      whereArgs: [id]
    );
  }
}