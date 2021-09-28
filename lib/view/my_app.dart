import 'package:flutter/material.dart';
import 'package:sigla_pais/view/paises_screen.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Siglas dos Países',
      home: PaisesScreen(),
    );
  }
}