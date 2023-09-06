import 'package:flutter/material.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({super.key});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 26, 131, 58),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          width: double.infinity,
          // decoration: const BoxDecoration(
          //   border: Border(bottom: BorderSide(width: 1)),
          // ),
          color: Colors.transparent,
          child: InkWell(
            borderRadius:
                BorderRadius.circular(0), // Define o border radius desejado
            onTap: () {
              // Lógica para lidar com o clique do botão
            },
            child: Container(
              padding: const EdgeInsets.all(
                  16), // Adicione algum espaçamento interno ao botão
              child: const Text(
                'Clientes',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        const Divider(),
      ]),
    );
  }
}
