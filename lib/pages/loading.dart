import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'loading';
  void setupWorldTime() async {
    WorldTime wt = new WorldTime(location: 'Sao_Paulo', flag: 'brasil.png', url: 'America/Sao_Paulo');
    await wt.getTime();
    setState((){
      time = wt.time;
    });
  }

  /**
   *  // initState roda uma única vez, ao instanciar o widget
   */
  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Text(time),
      ),
    );
  }
}
