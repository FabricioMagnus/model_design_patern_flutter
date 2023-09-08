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
  String email = "";

  setName() async {
    String token = await Api.getToken();
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    setState(() {
      name = decodedToken["nomeRepresentante"];
      email = decodedToken["email"];
    });
  }

  @override
  void initState() {
    super.initState();
    setName();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFEDFBEE),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // Image.asset("assets/logo.png", height: 70),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Text(
        //     name != '' ? "Bem vindo(a): adsdadkjhadskjhadskjhaskjhajshdkajhsdakjshdakjhsdkjasdkasdadkjhakjhadskjhadskjhkjhadskjhads" : "Engenho AM",
        //     style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        //     overflow: TextOverflow.ellipsis,
        //   ),
        // ),

        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xFF0C5311),
          ),
          height: 70,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset("assets/simpleLogo.png", height: 30),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "Bem Vindo(a): ",
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        children: <TextSpan>[
                          TextSpan(
                            text: name != '' ? name : "Engenho AM",
                            // style: const TextStyle(fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: email,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                        // children: <TextSpan>[
                        //   TextSpan(
                        //     text: email,
                        //     style: const TextStyle(fontWeight: FontWeight.normal),
                        //   ),
                        // ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        // const Divider(),
        // ButtonDrawer(onTap: () {}, title: "Clientes"),
        // const Divider(),
        ButtonDrawer(
            onTap: () {
              Navigator.pop(context);
              // Navigator.push(
              // context, MaterialPageRoute(builder: (context) => const Sellers()));
              Navigator.pushNamed(context, "/sellers");
            },
            title: "Vendedores"),
        const Divider(),
      ]),
    );
  }
}
