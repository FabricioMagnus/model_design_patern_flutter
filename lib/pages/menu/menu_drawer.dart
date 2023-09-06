import 'package:flutter/material.dart';
import 'package:model_design_patern_flutter/pages/menu/components/button_drawer.dart';

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
        ButtonDrawer(onTap: () {}, title: "Clientes"),
        const Divider(),
        ButtonDrawer(onTap: () {}, title: "Clientes"),
      ]),
    );
  }
}
