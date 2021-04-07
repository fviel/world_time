import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    WorldTime wt = new WorldTime(
        url: 'America/Sao_Paulo',
        location: 'São Paulo',
        flag: 'https://www.countryflags.io/br/shiny/32.png');
    await wt.getTime();
    print('Obteve dados da getTime');

    //pushNamed chamaria a próxima rota, mas manteria o widget atual na stack de memória
    //Navigator.pushNamed(context, '/home');
    //já  pushReplacementNamed, irá remover o widget atual da stack e colocar o novo
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location':wt.location,
      'flag':wt.flag,
      'time':wt.time,
      'isDayTime':wt.isDayTime,
    });
    /*setState((){
      time = wt.time;

    });*/
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
      backgroundColor: Colors.grey[900],
      body:Center(
        child: SpinKitWave(
          color:Colors.grey[500],
          size: 100.0,

        )


      )
    );
  }
}
