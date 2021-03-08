import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  int counter = 0;

  /**
   * simula um request de tempo variável para usar código assíncrono, pois um ws pode demorar x tempo...
   */
  void getData() async{
    //chama assincronamente, mas o 'await' define que o reto do método tem que esperar esse aqui primeiro
    //observe que a função dentro do Future vai retornar uma string pra var nome
    String nome = await Future.delayed(Duration(seconds:3), (){
       print('_ChooseLocationState.getDate ------ simula o request com delay 1 -------');
       return 'fernando';
    });

    //simula o request com delay obtendo a bio
    Future.delayed(Duration(seconds:3), (){
      print('_ChooseLocationState.getDate ------ simula o request com delay 2 - aguarda o 1 -------');
    });

    //simula o request com delay obtendo a bio
    Future.delayed(Duration(seconds:3), (){
      print('_ChooseLocationState.getDate ------ simula o request com delay 3 - aguarda o 1 -------');
    });

    print('mensagem após a função assíncrona ser chamada... $nome');
  }
  /**
   *  // initState roda uma única vez, ao instanciar o widget
   */
  @override
  void initState() {

    super.initState();
    print('_ChooseLocationState.initState executou---------');
    getData();
    print('método após o getData() async');
  }


  /**
   * build é executada sempre que realizado o setState();
   */
  @override
  Widget build(BuildContext context) {

    print('_ChooseLocationState.build executou---------');

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation:0
      ),
      //não precisa do safeArea, pois vou usar um appBar
      body: RaisedButton(
        onPressed: (){
          setState(() {
            counter++;
          });
        },
        child: Text('Contador: $counter'),
      ),
    );
  }
}
