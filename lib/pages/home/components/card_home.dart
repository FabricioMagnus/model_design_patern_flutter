import 'package:flutter/material.dart';

class CardHome extends StatelessWidget {
  final Icon icon;
  final String value;
  final String title;
  final Color color;

  const CardHome(
      {Key? key, required this.icon, this.value = "0", required this.title, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 150,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      // color: const Color.fromARGB(255, 177, 18, 18),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              icon,
            ]),
          ],
        ),
      ),
    );
  }
}
