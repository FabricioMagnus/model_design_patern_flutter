// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:model_design_patern_flutter/pages/home/components/card_home.dart';
import 'package:model_design_patern_flutter/pages/login/login.dart';
import 'package:model_design_patern_flutter/pages/menu/menu_drawer.dart';
import 'package:model_design_patern_flutter/services/api.dart';
import 'package:model_design_patern_flutter/services/clienteApi.dart';
import 'package:model_design_patern_flutter/services/vendaApi.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String quantitySales = "0";
  String quantityClients = "0";
  SharedPreferences? prefs;
  String name = "";
  String email = "";

  @override
  void initState() {
    super.initState();
    getPendSales();
    getPendClients();
    setName();
  }

  setName() async {
    String token = await Api.getToken();
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    setState(() {
      name = decodedToken["nomeRepresentante"];
      email = decodedToken["email"];
    });
  }

  getPendSales() async {
    try {
      String token = await Api.getToken();
      VendaApi vendaApi = VendaApi(token);

      var responseSales = await vendaApi.getQuantitySales();
      List<dynamic> filteredSales =
          responseSales.where((element) => element["status"] == "PE").toList();

      setState(() {
        quantitySales = filteredSales.length.toString();
      });
    } catch (e) {
      debugPrint("error na requisição de vendas: $e");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
        "Erro na requisição de vendas",
      )));
    }
  }

  getPendClients() async {
    try {
      String token = await Api.getToken();

      ClienteApi clienteApi = ClienteApi(token);

      var responseClients = await clienteApi.getQuantityClients();
      List<dynamic> filteredClients =
          responseClients.where((element) => element["status"] == 1).toList();

      setState(() {
        quantityClients = filteredClients.length.toString();
      });
    } catch (e) {
      debugPrint("error: $e");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
        "Erro na requisição de clientes",
      )));
    }
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFEDFBEE),
        drawer: const MenuDrawer(),
        appBar: AppBar(
          title: RichText(
            text: TextSpan(
              text: name != '' ? '$name - ' : "Engenho AM",
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                  text: email,
                  style: const TextStyle(fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Api.removeToken();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ));
              },
              icon: Image.asset('assets/simpleLogo.png'),
            ),
          ],
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(
                    "Engenho A. M. LTDA",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Color.fromARGB(255, 23, 92, 25)),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: Row(
                children: [
                  Text(
                    "Comércio e Beneficiamento de Arroz",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Row(children: [
                Text(
                  "Resumo",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ]),
            ),
            SizedBox(
              height: 200,
              child: PageView(children: [
                CardHome(
                  icon: const Icon(
                    Icons.verified_user,
                    color: Colors.white,
                  ),
                  title: 'Clientes Pendentes',
                  value: quantityClients,
                  color: Color.fromARGB(255, 23, 92, 25),
                ),
                CardHome(
                  icon: const Icon(
                    Icons.verified_user,
                    color: Colors.white,
                  ),
                  title: 'Vendas Pendentes',
                  value: quantitySales,
                  color: Color.fromARGB(255, 110, 34, 24),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
