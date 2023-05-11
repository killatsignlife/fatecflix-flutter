import 'package:fatecflix_mobile/dashboard.dart';
import 'package:fatecflix_mobile/data/database_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fatecflix_mobile/appController.dart';
import 'package:get/get.dart';

class AtualizarUsuario extends StatelessWidget {
  /* 
    TODO: Atualizar o Usuario (aluno) usando os campos:
     1. Nome Completo
     2. Email
     3. RA
     4. CPF
     5. Data de Nascimento
     6. Curso
     7. Ano de ingresso
     8. Periodo
     9. Senha
     10. Confirmação da Senha

     Colocar avisos antecedendo que o erro do usuario
  */

  final AppController controller = Get.put(AppController());
  //final AppController controller = Get.find();

  final dbHelper = DatabaseHelper.instance;
  
  AtualizarUsuario({super.key});

  static const String _title = 'FatecFlix';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_title), 
        backgroundColor: Colors.red,
        //automaticallyImplyLeading: false,
      ),
      body: Column(
        children: <Widget>[
         const Center(child: Text('Atualize um usuario')),
          Obx(() => Text(
            '${controller.message.value}',
          )),
          ElevatedButton(
            child: const Icon(Icons.add),
            onPressed: () {
              Get.to(Dashboard());
            },
          )
        ],
      ),
    );
  }

  void _atualizar() async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnId: 1,
      DatabaseHelper.columnNome: 'Maria',
      DatabaseHelper.columnSobrenome: 'da Conceição',
      DatabaseHelper.columnCurso: 'ADS',
      DatabaseHelper.columnEmail: 'maria@email.com',
      DatabaseHelper.columnRa: 1234555,
      DatabaseHelper.columnSemestre: 3,
    };

    final linhaAtualizada = await dbHelper.update(row);

    if (kDebugMode) {
      print('atualizadas $linhaAtualizada linha (s)');
    }
  }
}