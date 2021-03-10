import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  //https://www.countryflags.io/:country_code/:style/:size.png"
  List<WorldTime> locations = [
    WorldTime(
        url: 'America/Sao_Paulo',
        location: 'São Paulo',
        flag: 'https://www.countryflags.io/br/shiny/32.png'),
    WorldTime(
        url: 'Europe/London',
        location: 'London',
        flag: 'https://www.countryflags.io/gb/shiny/32.png'),
    WorldTime(
        url: 'Europe/Berlin',
        location: 'Berlin',
        flag: 'https://www.countryflags.io/de/shiny/32.png'),
    WorldTime(
        url: 'Africa/Cairo',
        location: 'Cairo',
        flag: 'https://www.countryflags.io/eg/shiny/32.png'),
    WorldTime(
        url: 'Africa/Nairobi',
        location: 'Nairobi',
        flag: 'https://www.countryflags.io/ke/shiny/32.png'),
    WorldTime(
        url: 'America/Chicago',
        location: 'Chicago',
        flag: 'https://www.countryflags.io/us/shiny/32.png'),
    WorldTime(
        url: 'America/New_York',
        location: 'New York',
        flag: 'https://www.countryflags.io/us/shiny/32.png'),
    WorldTime(
        url: 'Asia/Seoul',
        location: 'Seoul',
        flag: 'https://www.countryflags.io/kr/shiny/32.png'),
    WorldTime(
        url: 'Asia/Jakarta',
        location: 'Jakarta',
        flag: 'https://www.countryflags.io/id/shiny/32.png'),
  ];

  void updateTime(index) async {
    WorldTime wt = locations[index];
    await wt.getTime();
    Navigator.pop(context, {
      'location':wt.location,
      'flag':wt.flag,
      'time':wt.time,
      'isDayTime':wt.isDayTime,
    });
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
          elevation: 0),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
              child: Card(
                color: Colors.white,
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                    print(locations[index].location);
                  },
                  title: Text(
                    locations[index].location,
                  ),
                  leading: Image(
                    image: NetworkImage(locations[index].flag),
                    width: 32,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
