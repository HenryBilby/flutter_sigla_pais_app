import 'package:flutter/material.dart';
import 'package:sigla_pais/service/requisicao.dart';
import 'package:sigla_pais/view/menu.dart';
import 'package:sigla_pais/view/paises_dados.dart';

class PaisesScreen extends StatelessWidget {
  // const ({Key? key}) : super(key: key);
  final String pais;

  PaisesScreen({this.pais = ""});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Siglas dos Países"),
        actions: [
          IconButton(onPressed: () => {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => PaisesScreen()))
          }, 
              icon: Icon(Icons.refresh)),
        ],
      ),
      drawer: Menu(),
      body: PaisesDados(pais: pais),
    );
  }
}
