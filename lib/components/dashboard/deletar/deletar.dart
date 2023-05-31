import 'package:fatecflix_mobile/controller/appController.dart';
import 'package:fatecflix_mobile/components/dashboard/dashboard.dart';
import 'package:fatecflix_mobile/data/database_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeletarUsuario extends StatefulWidget {
  const DeletarUsuario(this.usuarioId, {super.key});
  final int? usuarioId;

  @override
  State<DeletarUsuario> createState() => _DeletarUsuarioState();
}

class _DeletarUsuario extends State<DeletarUsuario> {
  final AppController controller = Get.put(AppController());
  final dbHelper = DatabaseHelper.instance;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController idController = TextEditingController();
  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController raController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController nascimentoController = TextEditingController();
  TextEditingController cursoController = TextEditingController();
  TextEditingController anoIngressoController = TextEditingController();
  TextEditingController periodoController = TextEditingController();

  void _showMessafeInScafold(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

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
              body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              sizedBoxSpace,
              const Center(
                  child: Text(
                'Deletar dados do usuário',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              )),
              sizedBoxSpace,
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    //   child: TextFormField(
                    //     textInputAction: TextInputAction.next,
                    //     keyboardType: TextInputType.text,
                    //     decoration: const InputDecoration(
                    //         icon: Icon(Icons.person),
                    //         iconColor: Colors.black,
                    //         hintText: "Id do Usuario",
                    //         labelText: "Id",
                    //         labelStyle: TextStyle(
                    //             color: Colors.black, fontSize: labelFontSize)),
                    //     textAlign: TextAlign.center,
                    //     style: const TextStyle(
                    //         color: Color.fromARGB(202, 24, 23, 23),
                    //         fontSize: inputFontSize),
                    //     controller: idController,
                    //     validator: (value) {
                    //       if (value!.isEmpty) {
                    //         return "O id será gerado automaticamente";
                    //       }
                    //       return null;
                    //     },
                    //   ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.person),
                            iconColor: Colors.black,
                            hintText: "Nome completo",
                            labelText: "nome",
                            labelStyle: TextStyle(
                                color: Colors.black, fontSize: labelFontSize)),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Color.fromARGB(202, 24, 23, 23),
                            fontSize: inputFontSize),
                        controller: nomeController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Digite seu nome completo";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.email),
                            iconColor: Colors.black,
                            hintText: "usuario@email.com",
                            labelText: "e-mail",
                            labelStyle: TextStyle(
                                color: Colors.black, fontSize: labelFontSize)),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Color.fromARGB(202, 24, 23, 23),
                            fontSize: inputFontSize),
                        controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Digite seu e-mail";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.numbers_rounded),
                            iconColor: Colors.black,
                            hintText: "000000000000",
                            labelText: "RA",
                            labelStyle: TextStyle(
                                color: Colors.black, fontSize: labelFontSize)),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Color.fromARGB(202, 24, 23, 23),
                            fontSize: inputFontSize),
                        controller: raController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Digite seu RA";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.numbers),
                            iconColor: Colors.black,
                            hintText: "000.000.000-00",
                            labelText: "CPF",
                            labelStyle: TextStyle(
                                color: Colors.black, fontSize: labelFontSize)),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Color.fromARGB(202, 24, 23, 23),
                            fontSize: inputFontSize),
                        controller: cpfController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Digite seu CPF";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.datetime,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.date_range),
                            iconColor: Colors.black,
                            hintText: "00/00/0000",
                            labelText: "Data de Nascimento",
                            labelStyle: TextStyle(
                                color: Colors.black, fontSize: labelFontSize)),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Color.fromARGB(202, 24, 23, 23),
                            fontSize: inputFontSize),
                        controller: nascimentoController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Digite sua Data de Nascimento";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.book),
                            iconColor: Colors.black,
                            hintText: "DSM",
                            labelText: "Curso",
                            labelStyle: TextStyle(
                                color: Colors.black, fontSize: labelFontSize)),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Color.fromARGB(202, 24, 23, 23),
                            fontSize: inputFontSize),
                        controller: cursoController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Digite seu curso";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.datetime,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.date_range),
                            iconColor: Colors.black,
                            labelText: "Ano de ingresso",
                            labelStyle: TextStyle(
                                color: Colors.black, fontSize: labelFontSize)),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Color.fromARGB(202, 24, 23, 23),
                            fontSize: inputFontSize),
                        controller: anoIngressoController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Digite seu ano de ingresso";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.abc),
                            iconColor: Colors.black,
                            labelText: "Período",
                            hintText: "Manhã, Tarde, Noite, EAD",
                            labelStyle: TextStyle(
                                color: Colors.black, fontSize: labelFontSize)),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Color.fromARGB(202, 24, 23, 23),
                            fontSize: inputFontSize),
                        controller: periodoController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Digite o período do curso";
                          }
                          return null;
                        },
                      ),
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
                      child: const Text("Deletar Dados"),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          //int id = int.parse(idController.text);
                          _deletarUsuario(usuarioId);
                        }
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
                                builder: (context) => Dashboard()));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }

  void _deletarUsuario(id) async {
    final linhaDeletada = await dbHelper.delete(id!);
    _showMessafeInScafold('$linhaDeletada linha(s) deletada(s): linha $id');
  }
}
