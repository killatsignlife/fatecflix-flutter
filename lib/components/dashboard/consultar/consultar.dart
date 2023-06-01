import 'package:fatecflix_mobile/controller/app_controller.dart';
import 'package:fatecflix_mobile/components/dashboard/dashboard.dart';
import 'package:fatecflix_mobile/data/database_helper.dart';
// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/usuario.dart';

class ConsultarUsuario extends StatefulWidget {
  const ConsultarUsuario(this.usuarioId, {super.key});
  final int? usuarioId;

  @override
  State<ConsultarUsuario> createState() => _ConsultarUsuarioState();
}

class _ConsultarUsuarioState extends State<ConsultarUsuario> {
  final AppController controller = Get.put(AppController());
  final dbHelper = DatabaseHelper.instance;
  static const String _title = 'FatecFlix';
  List<Usuario> usuario = [];

  TextEditingController idController = TextEditingController();
  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController raController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController nascimentoController = TextEditingController();
  TextEditingController cursoController = TextEditingController();
  TextEditingController anoIngressoController = TextEditingController();
  TextEditingController periodoController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  void _consultaId(id) async {
    final user = await dbHelper.queryRows(id);
    for (var row in user) {
      usuario.add(Usuario.fromMap(row));
    }

    setState(() {
      idController.text = widget.usuarioId.toString();
      nomeController.text = usuario[0].nome!;
      emailController.text = usuario[0].email!;
      raController.text = usuario[0].ra!;
      cpfController.text = usuario[0].cpf!;
      nascimentoController.text = usuario[0].nascimento!;
      cursoController.text = usuario[0].curso!;
      anoIngressoController.text = usuario[0].anoIngresso!;
      periodoController.text = usuario[0].periodo!;
      senhaController.text = usuario[0].senha!;
    });
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
                'Visualizar dados do usuário',
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
                            labelText: 'RA',
                          ),
                          controller: raController,
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
                            labelText: 'Data de Nascimento',
                          ),
                          controller: nascimentoController,
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
                    Container(
                        padding: const EdgeInsets.all(20),
                        height: 100,
                        child: TextField(
                          enabled: false,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Ingresso',
                          ),
                          controller: anoIngressoController,
                        )),
                    Container(
                        padding: const EdgeInsets.all(20),
                        height: 100,
                        child: TextField(
                          enabled: false,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Período',
                          ),
                          controller: periodoController,
                        )),
                    Container(
                        padding: const EdgeInsets.all(20),
                        height: 100,
                        child: TextField(
                          enabled: false,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Senha',
                          ),
                          controller: senhaController,
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
                      child: const Text("Ir para a Dashboard"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Dashboard()));
                      },
                    ),
                    sizedBoxSpace,
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
