import 'package:fatecflix_mobile/controller/appController.dart';
import 'package:fatecflix_mobile/components/dashboard/dashboard.dart';
import 'package:fatecflix_mobile/data/database_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeletarUsuario extends StatelessWidget {
   /* 
    TODO: Deletar usuario
  */
  final AppController controller = Get.put(AppController());
  final dbHelper = DatabaseHelper.instance;

  DeletarUsuario({super.key});

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
         const Center(child: Text('Delete um usuario')),
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

  void _deletar() async {
    final id = await dbHelper.queryRowCount();
    final linhaDeletada = await dbHelper.delete(id!);

    if (kDebugMode) {
      print('Deletada(s) $linhaDeletada linha(s): linha $id');
    }
  }
}