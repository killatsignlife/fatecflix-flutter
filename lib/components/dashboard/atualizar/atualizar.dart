import 'dart:async';

import 'package:fatecflix_mobile/components/dashboard/dashboard.dart';
import 'package:fatecflix_mobile/data/database_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fatecflix_mobile/controller/appController.dart';
import 'package:get/get.dart';

import '../../../model/usuario.dart';

class AtualizarUsuario extends StatefulWidget {
  const AtualizarUsuario(this.usuarioId, {super.key});
  final int? usuarioId;

  @override
  State<AtualizarUsuario> createState() => _AtualizarUsuarioState();
}

class _AtualizarUsuarioState extends State<AtualizarUsuario> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController raController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController nascimentoController = TextEditingController();
  TextEditingController cursoController = TextEditingController();
  TextEditingController anoIngressoController = TextEditingController();
  TextEditingController periodoController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController confirmacaoSenhaController = TextEditingController();

  final dbHelper = DatabaseHelper.instance;

  void _showMessafeInScafold(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  @override
  void initState() {
    super.initState();
    _consultaId(widget.usuarioId);
  }

  List<Usuario> usuario = [];

  void _consultaId(id) async {
    final user = await dbHelper.queryRows(id);
    for (var row in user) {
      usuario.add(Usuario.fromMap(row));
    }
    setState(() {
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

  void _atualizar() async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnId: widget.usuarioId,
      DatabaseHelper.columnNome: nomeController.text,
      DatabaseHelper.columnSobrenome: nomeController.text,
      DatabaseHelper.columnEmail: emailController.text,
      DatabaseHelper.columnRa: raController.text,
      DatabaseHelper.columnCpf: cpfController.text,
      DatabaseHelper.columnDataNascimento: nascimentoController.text,
      DatabaseHelper.columnCurso: cursoController.text,
      DatabaseHelper.columnAnoIngresso: anoIngressoController.text,
      DatabaseHelper.columnPeriodo: periodoController.text,
      DatabaseHelper.columnSenha: senhaController.text
    };

    final linhaAtualizada = await dbHelper.update(row);

    _showMessafeInScafold('Usuário atualizado com succeso');

    if (kDebugMode) {
      print('atualizadas $linhaAtualizada linha (s)');
    }
  }

  @override
  Widget build(BuildContext context) {
    const inputFontSize = 18.0;
    const labelFontSize = 18.0;
    const sizedBoxSpace = SizedBox(height: 24);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Fatecflix'),
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
                'Atualizar dados do usuário',
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.password),
                            iconColor: Colors.black,
                            labelText: "Senha",
                            hintText: "",
                            labelStyle: TextStyle(
                                color: Colors.black, fontSize: labelFontSize)),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Color.fromARGB(202, 24, 23, 23),
                            fontSize: inputFontSize),
                        controller: senhaController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Digite sua senha";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.password),
                            iconColor: Colors.black,
                            labelText: "Confirmação de senha",
                            hintText: "",
                            labelStyle: TextStyle(
                                color: Colors.black, fontSize: labelFontSize)),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Color.fromARGB(202, 24, 23, 23),
                            fontSize: inputFontSize),
                        controller: confirmacaoSenhaController,
                        validator: (value) {
                          if (value!.isEmpty || value != senhaController.text) {
                            return "A confirmação deve ser preenchida e ser igual a senha";
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
                      child: const Text("Atualizar Dados"),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _atualizar();
                          var timer = Timer(
                              const Duration(seconds: 1),
                              () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Dashboard())));
                          timer;
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
        ));
  }
}
