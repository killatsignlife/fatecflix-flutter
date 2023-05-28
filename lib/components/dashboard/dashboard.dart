import 'package:fatecflix_mobile/controller/appController.dart';
import 'package:fatecflix_mobile/components/dashboard/atualizar/atualizar.dart';
import 'package:fatecflix_mobile/components/dashboard/cadastrar/cadastrar.dart';
import 'package:fatecflix_mobile/data/database_helper.dart';
import 'package:fatecflix_mobile/components/dashboard/deletar/deletar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatelessWidget {
  /* 
    TODO: Dashboard/Listagem de usuarios com o botão 
    para atualizar e deletar um registro; e 
    um botão 'Add' para adicionar usuario.
  */
  final AppController controller = Get.put(AppController());
  final dbHelper = DatabaseHelper.instance;
  Dashboard({super.key});

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
                          'Nome',
                          style: TextStyle(
                              fontStyle: FontStyle.italic, color: Colors.red),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Idade',
                          style: TextStyle(
                              fontStyle: FontStyle.italic, color: Colors.red),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Perfil',
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
                  rows: <DataRow>[
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text('Sarah')),
                        const DataCell(Text('19')),
                        const DataCell(Text('Estudante')),
                        DataCell(
                          ElevatedButton(
                            child: const Icon(Icons.update),
                            onPressed: () {
                              Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AtualizarUsuario()));
                            },
                          ),
                        ),
                        DataCell(
                          ElevatedButton(
                            child: const Icon(Icons.delete),
                            onPressed: () {
                               Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DeletarUsuario()));
                            },
                          ),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text('Janine')),
                        const DataCell(Text('43')),
                        const DataCell(Text('Administrador')),
                        DataCell(
                          ElevatedButton(
                            child: const Icon(Icons.update),
                            onPressed: () {
                              Get.to(AtualizarUsuario());
                            },
                          ),
                        ),
                        DataCell(
                          ElevatedButton(
                            child: const Icon(Icons.delete),
                            onPressed: () {
                               Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DeletarUsuario()));
                            },
                          ),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text('William')),
                        const DataCell(Text('27')),
                        const DataCell(Text('Instrutor')),
                        DataCell(
                          ElevatedButton(
                            child: const Icon(Icons.update),
                            onPressed: () {
                               Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AtualizarUsuario()));
                            },
                          ),
                        ),
                        DataCell(
                          ElevatedButton(
                            child: const Icon(Icons.delete),
                            onPressed: () {
                               Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DeletarUsuario()));
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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

  void _consultar() async {
    final todasLinhas = await dbHelper.queryAllRows();

    print('Consulta toda as linhas:');

    for (var row in todasLinhas) {
      if (kDebugMode) {
        print(row);
      }
    }
  }
}
