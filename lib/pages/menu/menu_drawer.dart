import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:model_design_patern_flutter/pages/menu/components/button_drawer.dart';
import 'package:model_design_patern_flutter/services/api.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({super.key});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  String name = '';

  setName() async {
    String token = await Api.getToken();
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    setState(() {
      name = decodedToken["nomeRepresentante"];
    });
  }

  @override
  void initState() {
    super.initState();
    setName();
  }

  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFFEDFBEE),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Image.asset("assets/logo.png", height: 70),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Text(
        //     name != '' ? "Bem vindo(a): adsdadkjhadskjhadskjhaskjhajshdkajhsdakjshdakjhsdkjasdkasdadkjhakjhadskjhadskjhkjhadskjhads" : "Engenho AM",
        //     style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        //     overflow: TextOverflow.ellipsis,
        //   ),
        // ),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: RichText(
        //     text: TextSpan(
        //       text: "Bem vindo(a): ",
        //       // style: DefaultTextStyle.of(context).style,
        //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        //       children: <TextSpan>[
        //         TextSpan(
        //           text: name != '' ? name : "Engenho AM",
        //           style: const TextStyle(fontWeight: FontWeight.normal),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        const Divider(),
        ButtonDrawer(onTap: () {}, title: "Clientes"),
        const Divider(),
        ButtonDrawer(onTap: () {}, title: "Vendedores"),
        const Divider(),
      ]),
    );
  }
}
