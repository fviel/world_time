import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  //https://www.countryflags.io/:country_code/:style/:size.png"
  List<WorldTime> locations = [
    WorldTime(url:'America/Sao_Paulo', location:'São Paulo', flag:'https://www.countryflags.io/br/flat/64.png'),
    WorldTime(url:'Europe/London', location:'London', flag:'https://www.countryflags.io/gb/flat/64.png'),
    WorldTime(url:'Europe/Berlin', location:'Berlin', flag:'https://www.countryflags.io/de/flat/64.png'),
    WorldTime(url:'Africa/Cairo', location:'Cairo', flag:'https://www.countryflags.io/ed/flat/64.png'),
    WorldTime(url:'Africa/Nairobi', location:'Nairobi', flag:'https://www.countryflags.io/ke/flat/64.png'),
    WorldTime(url:'America/Chicago', location:'Chicago', flag:'https://www.countryflags.io/us/flat/64.png'),
    WorldTime(url:'America/New_York', location:'New York', flag:'https://www.countryflags.io/us/flat/64.png'),
    WorldTime(url:'Asia/Seoul', location:'Seoul', flag:'https://www.countryflags.io/kr/flat/64.png'),
    WorldTime(url:'Asia/Jakarta', location:'Jakarta', flag:'https://www.countryflags.io/id/flat/64.png'),
  ];


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
          elevation: 0
      ),
    );
  }
}
