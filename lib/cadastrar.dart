import 'package:fatecflix_mobile/appController.dart';
import 'package:fatecflix_mobile/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CadastrarUsuario extends StatelessWidget {
   /* 
    TODO: Cadastro de Usuario (aluno) usando os campos:
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


  CadastrarUsuario({super.key});

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
         const Center(child: Text('Cadastre um aluno ou instrutor')),
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
}