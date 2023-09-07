import 'package:flutter/material.dart';

class ButtonDrawer extends StatelessWidget {
  final Function onTap;
  final String title;

  const ButtonDrawer({super.key, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // decoration: const BoxDecoration(
      //   border: Border(bottom: BorderSide(width: 1)),
      // ),
      color: Colors.transparent,
      child: InkWell(
        borderRadius:
            BorderRadius.circular(0), // Define o border radius desejado
        onTap: () => onTap,
        child: Container(
          padding: const EdgeInsets.all(
              16), // Adicione algum espaçamento interno ao botão
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF18A439),
            ),
          ),
        ),
      ),
    );
  }
}
