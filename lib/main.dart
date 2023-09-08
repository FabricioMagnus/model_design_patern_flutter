import 'package:flutter/material.dart';
import 'package:model_design_patern_flutter/pages/home/home.dart';
import 'package:model_design_patern_flutter/pages/login/login.dart';
import 'package:model_design_patern_flutter/pages/sellers/sellers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const Home(),
        '/sellers': (context) => const Sellers(),
      },
    );
  }
}
