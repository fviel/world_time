import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // como atrib da classe, apenas criei o map, mas eu vou puxar lá no build, pq sempre que feito o setState, o build é chamado
  Map dados = {};


  @override
  Widget build(BuildContext context) {

    //dados recebe os argumentos ao abrir esta tela
    dados = ModalRoute.of(context).settings.arguments;
    print(dados);

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          FlatButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/location');
            },
            icon: Icon(
              Icons.edit_location,
            ),
            label: Text('Edit Location'),
          )
        ],
      )),
    );
  }
}
