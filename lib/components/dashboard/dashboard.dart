import 'package:fatecflix_mobile/components/dashboard/consultar/consultar.dart';
import 'package:fatecflix_mobile/controller/app_controller.dart';
import 'package:fatecflix_mobile/components/dashboard/atualizar/atualizar.dart';
import 'package:fatecflix_mobile/components/dashboard/cadastrar/cadastrar.dart';
import 'package:fatecflix_mobile/data/database_helper.dart';
import 'package:fatecflix_mobile/components/dashboard/deletar/deletar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/usuario.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Usuario> usuarios = [];
  int? usuarioId;

  @override
  void initState() {
    super.initState();
    _consultar();
  }

  final AppController controller = Get.put(AppController());
  final dbHelper = DatabaseHelper.instance;

  static const String _title = 'FatecFlix';

  @override
  Widget build(BuildContext context) {
    const sizedBoxSpace = SizedBox(height: 24);

    return Scaffold(
        appBar: AppBar(
          title: const Text(_title),
          backgroundColor: Colors.red,
          //automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
          child: Column(
            children: <Widget>[
              const Center(
                  child: Text(
                'Dashboard - Usuarios Cadastrados',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              )),
              sizedBoxSpace,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Id',
                            style: TextStyle(
                                fontStyle: FontStyle.italic, color: Colors.red),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Nome',
                            style: TextStyle(
                                fontStyle: FontStyle.italic, color: Colors.red),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Curso',
                            style: TextStyle(
                                fontStyle: FontStyle.italic, color: Colors.red),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'CPF',
                            style: TextStyle(
                                fontStyle: FontStyle.italic, color: Colors.red),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Data Nasc.',
                            style: TextStyle(
                                fontStyle: FontStyle.italic, color: Colors.red),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Consultar',
                            style: TextStyle(
                                fontStyle: FontStyle.italic, color: Colors.red),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Atualizar',
                            style: TextStyle(
                                fontStyle: FontStyle.italic, color: Colors.red),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Deletar',
                            style: TextStyle(
                                fontStyle: FontStyle.italic, color: Colors.red),
                          ),
                        ),
                      ),
                    ],
                    rows: usuarios
                        .map<DataRow>((element) => DataRow(cells: [
                              DataCell(Text(element.id.toString())),
                              DataCell(Text(element.nome.toString())),
                              DataCell(Text(element.curso.toString())),
                              DataCell(Text(element.cpf.toString())),
                              DataCell(Text(element.nascimento.toString())),
                              DataCell(
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green[200]),
                                  child: const Icon(
                                    Icons.visibility,
                                  ),
                                  onPressed: () {
                                    usuarioId = element.id;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ConsultarUsuario(usuarioId)));
                                  },
                                ),
                              ),
                              DataCell(
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blueGrey),
                                  child: const Icon(
                                    Icons.update,
                                  ),
                                  onPressed: () {
                                    usuarioId = element.id;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AtualizarUsuario(usuarioId)));
                                  },
                                ),
                              ),
                              DataCell(
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red),
                                  child: const Icon(Icons.delete),
                                  onPressed: () {
                                    usuarioId = element.id;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DeletarUsuario(usuarioId)));
                                  },
                                ),
                              ),
                            ]))
                        .toList()),
              ),
              ElevatedButton(
                child: const Icon(Icons.add),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CadastrarUsuario()));
                },
              ),
            ],
          ),
        ));
  }

  // List todasLinhas;
  void _consultar() async {
    final todasLinhas = await dbHelper.queryAllRows();
    // ignore: avoid_print
    print('Consulta toda as linhas:');
    for (var row in todasLinhas) {
      usuarios.add(Usuario.fromMap(row));

      if (kDebugMode) {
        print(row);
      }

      setState(() {});
    }
  }
}
