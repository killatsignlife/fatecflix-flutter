import 'package:fatecflix_mobile/appController.dart';
import 'package:fatecflix_mobile/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeletarUsuario extends StatelessWidget {
   /* 
    TODO: Deletar usuario
  */
  final AppController controller = Get.put(AppController());

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
}