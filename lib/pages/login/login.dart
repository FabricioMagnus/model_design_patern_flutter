import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 249, 249),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 70,
                ),
                Row(
                  children: [
                    Expanded(child: Container()),
                    Expanded(
                      flex: 7,
                      child: Image.network(
                          "https://amvendas.softkuka.com.br/logo.png"),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Bem vindo!",
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 35,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Insira suas credenciais para entrar no sistema",
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0), fontSize: 12),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    height: 30,
                    alignment: Alignment.center,
                    child: const TextField(
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 0),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Color.fromARGB(255, 0, 100, 20),
                        )),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Color.fromARGB(255, 0, 100, 20),
                        )),
                        hintText: "Digite seu e-mail",
                        hintStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Color.fromARGB(255, 0, 100, 20),
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 25,
                ),
                Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    height: 30,
                    alignment: Alignment.center,
                    child: const TextField(
                      style: TextStyle(color: Color.fromARGB(255, 3, 3, 3)),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 0),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 100, 20),
                          )),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 100, 20),
                          )),
                          hintText: "Digite sua senha",
                          hintStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(
                            Icons.password_outlined,
                            color: Color.fromARGB(255, 0, 100, 20),
                          ),
                          suffixIcon: Icon(
                            Icons.visibility,
                            color: Colors.white,
                          )),
                    )),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  height: 40,
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: TextButton(
                        style: ButtonStyle(
                            shape:
                                MaterialStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            )),
                            backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 0, 100, 20),
                            )),
                        onPressed: () {},
                        child: const Text(
                          "ENTRAR",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
