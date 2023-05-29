import 'package:fatecflix_mobile/data/database_helper.dart';

class Usuario {
  int? id;
  String? nome;
  String? email;
  String? ra;
  String? cpf;
  String? nascimento;
  String? curso;
  String? anoIngresso;
  String? periodo;
  String? senha;

  Usuario(this.id, this.nome, this.email, this.ra, this.cpf, this.nascimento,
      this.curso, this.anoIngresso, this.periodo, this.senha);

  Usuario.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    nome = map["nome"];
    email = map["email"];
    cpf = map["cpf"];
    nascimento = map["nascimento"];
    curso = map["curso"];
    anoIngresso = map["anoIngresso"];
    periodo = map["periodo"];
    senha = map["senha"];
  }

Map<String, dynamic> toMap() {
    return {
      DatabaseHelper.columnId: id,
      DatabaseHelper.columnNome: nome,
      DatabaseHelper.columnSobrenome: nome,
      DatabaseHelper.columnEmail: email,
      DatabaseHelper.columnRa: ra,
      DatabaseHelper.columnCpf: cpf,
      DatabaseHelper.columnDataNascimento: nascimento,
      DatabaseHelper.columnCurso: curso,
      DatabaseHelper.columnAnoIngresso: anoIngresso,
      DatabaseHelper.columnPeriodo: periodo,
      DatabaseHelper.columnSenha: senha,
    };
    
  }


}
