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
   // fique esperto nesse ternário...
    //sempre rodo o build no ststate, então, se o array de dados estiver preenchido, usa ele, senão roteia pra tela
    dados = dados.isNotEmpty ? dados : ModalRoute.of(context).settings.arguments ;


    String definirBackground(){
      if(dados['isDayTime'] == null){
        return 'assets/images/day.png';
      }
      if(dados['isDayTime']){
        return 'assets/images/day.png';
      }
      return 'assets/images/night.png';
    }

    Color definirCorFundoBarra(){
      if(dados['isDayTime'] == null){
        return Colors.blue;
      }
     return dados['isDayTime'] ? Colors.blue : Colors.indigo[700];
    }

    // set background image
    //o código abaixo falha no assert de not null de boolean;
    //String bgImage = dados['isDaytime'] ? 'day.png' : 'night.png';


    //Color bgColor = dados['isDaytime'] ? Colors.blue : Colors.indigo[700];


    return Scaffold(
      backgroundColor: definirCorFundoBarra(),

      body: SafeArea(
          child: Container(
            decoration:BoxDecoration(
              image:DecorationImage(
                  image: AssetImage(definirBackground()),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
              child: Column(
        children: <Widget>[
              FlatButton.icon(
                onPressed: () async {
                  dynamic result = await Navigator.pushNamed(context, '/location');
                  if(result != null) {
                    setState(() {
                      //dados recebe um map
                      dados = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDayTime': result['isDayTime'],
                        'flag': result['flag'],
                      };
                    });
                  }
                },
                icon: Icon(
                  Icons.edit_location,
                  color: Colors.grey[300],
                ),
                label: Text(
                    'Edit Location',
                     style: TextStyle(
                       color: Colors.grey[300],
                     )
                ),
              ),
              SizedBox(height:20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[
                  Text(
                    dados['location'],
                    style: TextStyle(
                      color: Colors.white,
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
                color: Colors.white,
              ),
            ),
        ],
      ),
            ),
          )),
    );
  }
}
