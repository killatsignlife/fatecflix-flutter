import 'dart:async';

import 'package:fatecflix_mobile/components/dashboard/dashboard.dart';
import 'package:fatecflix_mobile/data/database_helper.dart';
// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../model/usuario.dart';

class DeletarUsuario extends StatefulWidget {
  const DeletarUsuario(this.usuarioId, {super.key});
  final int? usuarioId;

  @override
  State<DeletarUsuario> createState() => _DeletarUsuarioState();
}

class _DeletarUsuarioState extends State<DeletarUsuario> {
  final dbHelper = DatabaseHelper.instance;
  static const String _title = 'FatecFlix';
  List<Usuario> usuario = [];

  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController cursoController = TextEditingController();
  TextEditingController idController = TextEditingController();

  void _showMessafeInScafold(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  String nome = "";
  String email = "";
  String cpf = "";
  String curso = "";

  void _consultaId(id) async {
    final user = await dbHelper.queryRows(id);
    for (var row in user) {
      usuario.add(Usuario.fromMap(row));
    }

    setState(() {
      nomeController.text = usuario[0].nome!;
      emailController.text = usuario[0].email!;
      cpfController.text = usuario[0].cpf!;
      cursoController.text = usuario[0].curso!;
      idController.text = widget.usuarioId.toString();
    });
  }

  void _deletarUsuario(id) async {
    await dbHelper.delete(id!);
    _showMessafeInScafold('Usuário deletado com sucesso - Id:  $id');
  }

  @override
  void initState() {
    super.initState();
    _consultaId(widget.usuarioId);
  }

  @override
  Widget build(BuildContext context) {
    const sizedBoxSpace = SizedBox(height: 26);

    return Scaffold(
        appBar: AppBar(
          title: const Text(_title),
          backgroundColor: Colors.red,
          //automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              sizedBoxSpace,
              const Center(
                  child: Text(
                'Deletar usuário',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              )),
              sizedBoxSpace,
              Center(
                child: Column(
                  children: <Widget>[
                    Container(
                        padding: const EdgeInsets.all(20),
                        height: 100,
                        child: TextField(
                          enabled: false,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'id',
                          ),
                          controller: idController,
                        )),
                    Container(
                        padding: const EdgeInsets.all(20),
                        height: 100,
                        child: TextField(
                          enabled: false,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Nome',
                          ),
                          controller: nomeController,
                        )),
                    Container(
                        padding: const EdgeInsets.all(20),
                        height: 100,
                        child: TextField(
                          enabled: false,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'email',
                          ),
                          controller: emailController,
                        )),
                    Container(
                        padding: const EdgeInsets.all(20),
                        height: 100,
                        child: TextField(
                          enabled: false,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'CPF',
                          ),
                          controller: cpfController,
                        )),
                    Container(
                        padding: const EdgeInsets.all(20),
                        height: 100,
                        child: TextField(
                          enabled: false,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Curso',
                          ),
                          controller: cursoController,
                        )),
                    sizedBoxSpace,
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(320.0, 48.0),
                          backgroundColor:
                              const Color.fromARGB(255, 22, 12, 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          )),
                      child: const Text("Deletar Dados"),
                      onPressed: () {
                        _deletarUsuario(widget.usuarioId);
                        var timer = Timer(
                            const Duration(seconds: 1),
                            () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Dashboard())));
                        timer;
                      },
                    ),
                    sizedBoxSpace,
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(320.0, 48.0),
                          backgroundColor:
                              const Color.fromARGB(255, 22, 12, 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          )),
                      child: const Text("Ir para a Dashboard"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Dashboard()));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
