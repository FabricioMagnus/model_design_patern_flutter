import 'package:flutter/material.dart';
import 'package:model_design_patern_flutter/pages/home/components/card_home.dart';
import 'package:model_design_patern_flutter/pages/menu/menu_drawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const MenuDrawer(),
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Text("Resumo")
                ]
              ),
            ),
            SizedBox(
              height: 200,
              child: PageView(children: const [
                CardHome(
                  icon: Icon(
                    Icons.verified_user,
                    color: Colors.white,
                  ),
                  title: 'Clientes Pendentes',
                  value: '7',
                  color: Color.fromARGB(255, 23, 92, 25),
                ),
                CardHome(
                  icon: Icon(
                    Icons.verified_user,
                    color: Colors.white,
                  ),
                  title: 'Vendas Pendentes',
                  value: '3',
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
