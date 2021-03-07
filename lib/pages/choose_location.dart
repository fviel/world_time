import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  int counter = 0;
  /**
   *  // initState roda uma única vez, ao instanciar o widget
   */
  @override
  void initState() {

    super.initState();
    print('_ChooseLocationState.initState executou---------');
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
