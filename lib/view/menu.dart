import 'package:flutter/material.dart';
import 'package:sigla_pais/view/ajuda.dart';
import 'package:sigla_pais/view/mensagem.dart';
import 'package:sigla_pais/view/paises_screen.dart';

class Menu extends StatelessWidget with Mensagem {
  // const Menu({Key? key}) : super(key: key);

  final TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Drawer(
          child: ListView(
            children: [
              Container(
                alignment: Alignment.center,
                color: Colors.orangeAccent,
                height: 100.0,
                child: Text("Menu",
                  style: TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.w400),)
              ),
              ListTile(
                leading: Icon(Icons.search),
                title: Text("Pesquisar") ,
                onTap: () => {
                  Navigator.pop(context),
                  showDialog(context: context,
                            builder: (BuildContext context) =>
                                      SimpleDialog(title: Text("Digite o nome do país: "),
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: TextField( controller: search ),
                                        ),
                                        Row(
                                          children: [
                                            TextButton(onPressed: () => {
                                                        Navigator.pop(context),
                                                        showMensagem("Pesquisa realizada para o país ${search.text}."),
                                                        Navigator.push(context,
                                                            MaterialPageRoute(builder:
                                                                (BuildContext context) => PaisesScreen(pais: search.text)
                                                            )
                                                        ),
                                                      },
                                                      child: Text("OK",
                                                                  style: TextStyle(color: Colors.orangeAccent),)
                                            ),
                                            TextButton(onPressed: () => {
                                                          Navigator.pop(context),
                                                          showMensagem("Pesquisa cancelada."),
                                                        },
                                                      child: Text("Cancelar",
                                                                  style: TextStyle(color: Colors.black45),)
                                            ),
                                          ],
                                          mainAxisAlignment: MainAxisAlignment.center,
                                        ),
                                      ],
                                      )
                  ),
                },
              ),
              ListTile(
                leading: Icon(Icons.help),
                title: Text("Ajuda") ,
                onTap: () => {
                  Navigator.pop(context),
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Ajuda())),
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
