import 'package:flutter/material.dart';
import 'package:sigla_pais/service/requisicao.dart';

class PaisesDados extends StatefulWidget {

  final String pais;

  PaisesDados({this.pais = ""});

  @override
  _PaisesDadosState createState() => _PaisesDadosState();
}

class _PaisesDadosState extends State<PaisesDados> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          FutureBuilder(
              future: Requisicao.requisicaoPaises(),
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                if (snapshot.hasData) {
                  List? paises = snapshot.data;
                  return _listaPaises(_filtraPais(widget.pais, paises, context));
                } else {
                  return Container(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Text("Carregando dados...", style: TextStyle(fontSize: 16.0),),
                    ),
                  );
                }
              }),
        ],
      ),
    );
  }

  Widget _listaPaises(List? paises) {
    //O retorno é um if ternário, caso paises não seja null, renderiza uma Flexible,
    // se for null, renderiza um container com mensagem de carregando
    return paises != null
        ? Flexible(
          child: ListView.builder(
              itemCount: paises.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Card(
                    child: ExpansionTile(
                        title: Text("${paises[index]["name"]}",
                                    style: TextStyle(color: Colors.blueAccent,
                                                     fontWeight: FontWeight.bold,
                                                     fontSize: 20.0),
                                ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text("${paises[index]["code"] ?? "---"}",
                                          style: TextStyle(color: Colors.grey,
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 16.0),
                                      ),
                            ),
                          )
                        ],
                    ),
                  ),
                );
              })
        )
        : Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(50.0),
              child: Text("Carregando dados...", style: TextStyle(fontSize: 16.0),),
          ),
        );
  }

  List? _filtraPais(String pais, List? paises, BuildContext context) {
    List filtro = [];

    paises!.forEach((element) {
      if (element["name"] == pais) {
        filtro.add(element);
      }
    });

    return filtro.isNotEmpty? filtro : paises;
  }
}
