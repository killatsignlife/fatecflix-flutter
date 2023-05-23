import 'package:fatecflix_mobile/data/database_helper.dart';

class Student {
  int? id;
  String? nome;
  BigInt? ra;
  int? cpf;
  String? email;
  String? dataNascimento;
  String? curso;
  int? anoIngresso;
  int? periodo;
  String? senha;

  Student(
    this.id, 
    this.nome, 
    this.ra, 
    this.cpf,
    this.email,
    this.dataNascimento, 
    this.curso, 
    this.anoIngresso, 
    this.periodo, 
    this.senha
  );

  Student.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    nome = map['nome']; 
    ra = map['ra'];
    cpf = map['cpf'];
    email = map['email'];
    dataNascimento = map['dataNascimento']; 
    curso = map['curso'];
    anoIngresso = map['anoIngresso']; 
    periodo = map['periodo']; 
    senha = map['senha'];
  }

  Map<String, dynamic> toMap() {
    return {
      DatabaseHelper.columnId: id,
      DatabaseHelper.columnNome: nome,
      DatabaseHelper.columnRa: ra,
      DatabaseHelper.columnCpf: cpf,
      DatabaseHelper.columnEmail: email,
      DatabaseHelper.columnDataNascimento: dataNascimento,
      DatabaseHelper.columnCurso: curso,
      DatabaseHelper.columnAnoIngresso: anoIngresso,
      DatabaseHelper.columnSemestre: periodo,
      DatabaseHelper.columnSenha: senha,
    };
  }
}