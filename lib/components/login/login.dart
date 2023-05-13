import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

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
  String _info = "Informe seu e-mail e senha para logar no sistema";
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  void _resetaCampos() {
    emailController.text = "";
    senhaController.text = "";
    setState(() {
      _info = "Informe seu e-mail e senha para logar no sistema";
      _formKey = GlobalKey<FormState>();
    });
  }

  void _login() {
    setState(() {
      String email = emailController.text;
      String senha = emailController.text;
      _info = "email: $email, senha: $senha";
    });
  }

  @override
  Widget build(BuildContext context) {
    const sizedBoxSpace = SizedBox(height: 24);
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue,
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
            body: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Formulário de Login",
                      style: TextStyle(
                        fontSize: 26,
                      ),
                    ),
                    sizedBoxSpace,
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.email),
                        hintText: "usuario@email.com",
                        labelText: "e-mail",
                      ),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 2, 2, 2), fontSize: 25.0),
                      controller: emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Insira seu email";
                        }
                        return null;
                      },
                    ),
                    sizedBoxSpace,
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.password),
                        labelText: "senha",
                      ),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 2, 2, 2), fontSize: 25.0),
                      controller: senhaController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Insira sua senha";
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _login();
                          }
                        },
                        child: const Text(
                          "ENTRAR",
                          style: TextStyle(
                              color: Color.fromARGB(255, 14, 13, 13),
                              fontSize: 25.0),
                        ),
                      ),
                    ),
                    Text(
                      _info,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 24, 23, 23),
                          fontSize: 25.0),
                    )
                  ],
                ),
              ),
            )));
  }
}

// Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topRight,
//                 end: Alignment.bottomLeft,
//                 colors: [
//                   Colors.blue,
//                   Colors.red,
//                 ],
//             ),
//           ),
//         ),