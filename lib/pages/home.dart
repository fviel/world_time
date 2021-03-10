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


    return Scaffold(
      backgroundColor: Colors.grey[500],
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
        children: <Widget>[
            FlatButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/location');
              },
              icon: Icon(
                Icons.edit_location,
              ),
              label: Text(
                  'Edit Location'
              ),
            ),
            SizedBox(height:20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget>[
                Text(
                  dados['location'],
                  style: TextStyle(
                    fontSize: 28.0,
                    letterSpacing: 2.0,
                  ),
                ),
              ],
            ),
          SizedBox(height:20.0),
          Text(
            dados['time'],
            style:TextStyle(
                fontSize: 66.0,
              color: Colors.amber,
            ),
          ),
        ],
      ),
          )),
    );
  }
}
