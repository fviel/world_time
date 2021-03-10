import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time; // o tempo naquela localização
  String flag; //url para o assets url flag icon
  String url; //url ond vou buscar o horário - api endpoint
  String urlBase;
  
  WorldTime({this.location, this.flag, this.url}) {
    urlBase = 'https://worldtimeapi.org/api/timezone/';
    //Intl.defaultLocale = 'pt_BR';
  }

  Future<void> getTime() async {
    try{
      if (url.isEmpty) {
        url = 'America/Sao_Paulo';
      }
      Response response = await get(urlBase + url);
      Map data = jsonDecode(response.body);
      String utc_offset = data['utc_offset'].substring(1, 3);
      int intOffset = int.parse(utc_offset);
      DateTime horario = DateTime.parse(data['datetime']);
      horario.add(Duration(hours: intOffset));
      //time = horario.toString();
      //time = DateFormat.jm().format(horario);
      // print(DateFormat.jms().format(horario));
      // print(DateFormat.jm().format(horario));
      // print(DateFormat.d().format(horario));
      // print(DateFormat.MEd().format(horario));
      // print(DateFormat.yMMMMEEEEd().format(horario));

      time = DateFormat.jm().format(horario);
    }catch(e){
      print('ERRO: $e');
      time = 'Não foi possível obter o horário';
    }
  }
}


