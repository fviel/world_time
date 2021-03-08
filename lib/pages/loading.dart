import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  DateTime _horarioSp;
  /**
   * simula um request de tempo variável para usar código assíncrono, pois um ws pode demorar x tempo...
   */
  void getTestData() async{
    //obtém a resposta de uma chamada neste endereço
    Response response = await get('https://jsonplaceholder.typicode.com/todos/1');
    print('Resposta da chamada assíncrona http: $response.body');
    print(response.body);
    Map data = jsonDecode(response.body);
    print(data['title']);
  }

  void getTime() async{
    //1 . realiza o requesto do timestamp:
    Response response = await get('https://worldtimeapi.org/api/timezone/America/Sao_Paulo');
    Map data = jsonDecode(response.body);
    print(data);
    //String datetime = data['datetime'];
    String utc_offset = data['utc_offset'].substring(1, 3);
    print(utc_offset);
    //converter string para integer
    int intOffset = int.parse(utc_offset);
    DateTime now = DateTime.parse(data['datetime']);
    now.add(Duration(hours: intOffset));
    print(now);
    _horarioSp = now;
  }
  /**
   *  // initState roda uma única vez, ao instanciar o widget
   */
  @override
  void initState() {
    super.initState();
    getTime();
    // print('_ChooseLocationState.initState executou---------');
    // getTestData();
    // print('método após o getData() async');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('$_horarioSp'),
    );
  }
}
