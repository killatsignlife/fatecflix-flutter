import 'package:fatecflix_mobile/appController.dart';
import 'package:fatecflix_mobile/atualizar.dart';
import 'package:fatecflix_mobile/cadastrar.dart';
import 'package:fatecflix_mobile/deletar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatelessWidget {
  /* 
    TODO: Dashboard/Listagem de usuarios com o botão 
    para atualizar e deletar um registro; e 
    um botão 'Add' para adicionar usuario.
  */
  final AppController controller = Get.put(AppController());
  Dashboard({super.key});

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
          const Center(child: Text('Dashboard - Usuarios Cadastrados')),
          DataTable(
              columns: const <DataColumn>[
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Nome',
                      style: TextStyle(fontStyle: FontStyle.italic, color: Colors.red),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Idade',
                      style: TextStyle(fontStyle: FontStyle.italic, color: Colors.red),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Perfil',
                      style: TextStyle(fontStyle: FontStyle.italic, color: Colors.red),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Atualizar',
                      style: TextStyle(fontStyle: FontStyle.italic, color: Colors.red),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Deletar',
                      style: TextStyle(fontStyle: FontStyle.italic, color: Colors.red),
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
                            Get.to(AtualizarUsuario());
                        },
                      ),
                    ),
                    DataCell(
                      ElevatedButton(
                        child: const Icon(Icons.delete),
                        onPressed: () {
                            Get.to(DeletarUsuario());
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
                            Get.to(DeletarUsuario());
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
                            Get.to(AtualizarUsuario());
                        },
                      ),
                    ),
                    DataCell(
                      ElevatedButton(
                        child: const Icon(Icons.delete),
                        onPressed: () {
                            Get.to(DeletarUsuario());
                        },
                      ),
                    ),
                ],
              ),
            ],
          ),
          ElevatedButton(
            child: const Icon(Icons.add),
            onPressed: () {
              Get.to(CadastrarUsuario());
            },
          ),
        ],
      ),
    );
  }

  void _consultar() async {
    final todasLinhas = await dbHelper.
  }
}