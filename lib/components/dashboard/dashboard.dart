import 'package:fatecflix_mobile/controller/appController.dart';
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

/* 
    TODO: Dashboard/Listagem de usuarios com o botão 
    para atualizar e deletar um registro; e 
    um botão 'Add' para adicionar usuario.
  */
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
                                  child: const Icon(Icons.update),
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
                                  child: const Icon(Icons.delete),
                                  onPressed: () {
                                    usuarioId = element.id;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DeletarUsuario()));
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
                          builder: (context) => CadastrarUsuario()));
                },
              ),
            ],
          ),
        ));
  }

  // List todasLinhas;
  void _consultar() async {
    final todasLinhas = await dbHelper.queryAllRows();
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
