import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  /**
   * simula um request de tempo variável para usar código assíncrono, pois um ws pode demorar x tempo...
   */
  void getData() async{
    //obtém a resposta de uma chamada neste endereço
    Response response = await get('https://jsonplaceholder.typicode.com/todos/1');
    print('Resposta da chamada assíncrona http: $response.body');
    print(response.body);
    Map data = jsonDecode(response.body);
    print(data['title']);
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('loading'),
    );
  }
}
