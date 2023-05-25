import 'package:fatecflix_mobile/appController.dart';
import 'package:fatecflix_mobile/dashboard.dart';
import 'package:fatecflix_mobile/data/database_helper.dart';
import 'package:fatecflix_mobile/model/student.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CadastrarUsuario extends StatelessWidget {
  final AppController controller = Get.put(AppController());

  final dbHelper = DatabaseHelper.instance;

  // controllers used in insert operation ui
  TextEditingController nomeController = TextEditingController();
  TextEditingController raController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dataNascimentoController = TextEditingController();
  TextEditingController cursoController = TextEditingController();
  TextEditingController anoIngressoController = TextEditingController();
  TextEditingController periodoController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  CadastrarUsuario({super.key});

  static const String _title = 'FatecFlix';

    // void _showMessageInScaffold(String message) {
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
    // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_title), 
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: <Widget>[
         const Center(child: Text('Cadastre um aluno ou instrutor')),
          Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nome do Aluno'
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: raController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'RA do Aluno'
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: cpfController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'CPF do Aluno'
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'E-mail do Aluno'
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: dataNascimentoController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Data de Nascimento do Aluno'
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: cursoController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Curso que está matriculado'
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: anoIngressoController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Ano que ingressou no curso'
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: periodoController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Periodo que está cursando'
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: senhaController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Senha para acessar a plataforma'
              ),
            ),
          ),
          ElevatedButton(
            child: const Icon(Icons.add),
            onPressed: () {
              _inserir();
            },
          )
        ],
      ),
    );
  }

  void _inserir() async {
    String nome = nomeController.text;
    int ra = int.parse(raController.text);
    int cpf = int.parse(cpfController.text);
    String email = emailController.text;
    String dataNascimento = dataNascimentoController.text;
    String curso = cursoController.text;
    int anoIngresso = int.parse(anoIngressoController.text);
    int periodo = int.parse(periodoController.text);
    String senha = senhaController.text;

    Student aluno = Student(
      nome,
      ra, 
      cpf, 
      email, 
      dataNascimento, 
      curso, 
      anoIngresso, 
      periodo, 
      senha
    );

    final id = await dbHelper.insert(aluno);

    // final id = await dbHelper.insert(row);
    if (kDebugMode) {
      print('linha inserida com o id: $id');
    }

    Get.to(Dashboard());
  }
}