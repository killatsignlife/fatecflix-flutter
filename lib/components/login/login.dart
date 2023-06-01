import 'dart:async';

import 'package:fatecflix_mobile/components/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

import '../../data/database_helper.dart';
import '../../model/usuario.dart';

//https://www.kindacode.com/article/flutter-set-gradient-background-color-for-entire-screen/
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Fatecflix',
      home: LoginWidget(),
    );
  }
}

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  String _info =
      "Informe seu e-mail e senha para logar no sistema \n teste: email: aluno@email.com \n senha: 12345678";
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  final dbHelper = DatabaseHelper.instance;
  var init = 0;
  bool validacao = false;

  //inicializando a database
  // ignore: unused_element
  _databaseInit() async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnNome: "Aluno teste",
      DatabaseHelper.columnSobrenome: "Aluno teste",
      DatabaseHelper.columnEmail: "aluno@email.com",
      DatabaseHelper.columnRa: "9999999999",
      DatabaseHelper.columnCpf: "99999999999",
      DatabaseHelper.columnDataNascimento: "09/09/09",
      DatabaseHelper.columnCurso: "DSM",
      DatabaseHelper.columnAnoIngresso: "2020",
      DatabaseHelper.columnPeriodo: "Manhã",
      DatabaseHelper.columnSenha: "12345678"
    };
    await dbHelper.insert(row);
  }

  void _showMessafeInScafold(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  void _resetaCampos() {
    emailController.text = "";
    senhaController.text = "";
    setState(() {
      _info =
          "Informe seu e-mail e senha para logar no sistema \n teste: email: aluno@email.com \n senha: 12345678";
      _formKey = GlobalKey<FormState>();
    });
  }

  // ignore: unused_element
  void _login() {
    String email = emailController.text;
    _validaUsuario(email);
  }

  List<Usuario> usuarioInformado = [];

  _validaUsuario(email) async {
    var user = await dbHelper.queryRowsLogin(email);
    String senha = senhaController.text;
    for (var row in user) {
      usuarioInformado.add(Usuario.fromMap(row));
    }
    if (usuarioInformado[0].senha! == senha) {
      _showMessafeInScafold('Login realizado com sucesso');
      validacao = true;
    } else {
      _showMessafeInScafold('email ou senha inválidos');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (init == 0) {
      _databaseInit();
      init = 1;
    }

    const sizedBoxSpace = SizedBox(height: 24);
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.white,
              Colors.red,
            ],
          ),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.black45,
              title: const Text('Fatecflix'),
            ),
            body: Center(
                child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(14, 10, 14, 10),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 194, 41, 31)),
                    ),
                    sizedBoxSpace,
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.email),
                            iconColor: Colors.white,
                            hintText: "usuario@email.com",
                            labelText: "e-mail",
                            labelStyle:
                                TextStyle(color: Colors.white, fontSize: 18)),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Color.fromARGB(202, 24, 23, 23),
                            fontSize: 22.0),
                        controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Insira seu email";
                          }
                          return null;
                        },
                      ),
                    ),
                    sizedBoxSpace,
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.password),
                            iconColor: Colors.white,
                            labelText: "senha",
                            labelStyle:
                                TextStyle(color: Colors.white, fontSize: 18)),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Color.fromARGB(202, 24, 23, 23),
                            fontSize: 22.0),
                        controller: senhaController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Insira sua senha";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0, bottom: 10.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(320.0, 48.0),
                            backgroundColor:
                                const Color.fromARGB(255, 194, 41, 31),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            )),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _login();
                          }
                          if (validacao == true) {
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
                        child: const Text(
                          "ENTRAR",
                          style: TextStyle(color: Colors.white, fontSize: 22.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(320.0, 48.0),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            )),
                        onPressed: () {
                          _resetaCampos();
                        },
                        child: const Text(
                          "Apagar",
                          style: TextStyle(
                              color: Color.fromARGB(255, 194, 41, 31),
                              fontSize: 22.0),
                        ),
                      ),
                    ),
                    sizedBoxSpace,
                    sizedBoxSpace,
                    Text(
                      _info,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Color.fromARGB(202, 24, 23, 23),
                          fontSize: 20.0),
                    )
                  ],
                ),
              ),
            ))));
  }
}
