import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';


class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Africa/Johannesburg', location: 'Johannesburg', flag: 'sa.jpg' ),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'egypt.png' ),
    WorldTime(url: 'America/Barbados', location: 'Barbados', flag: 'barb.jpg' ),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.jpg' ),
    WorldTime(url: 'Europe/Madrid', location: 'Madrid', flag: 'spain.jpg' ),
    WorldTime(url: 'Asia/Colombo', location: 'Colombo', flag: 'sl.jpg' ),
    WorldTime(url: 'Australia/Melbourne', location: 'Melbourne', flag: 'aus.png' ),
    WorldTime(url: 'Asia/Tokyo', location: 'Tokyo', flag: 'jp.jpg' ),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'sk.png' ),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.jpg' ),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();

    Navigator.pop(context, {
      'location': instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDayTime' : instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          'Choose Location',
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(backgroundImage: AssetImage('assets/${locations[index].flag}')),

              ),
            ),
          );

        },
      ),
    );
  }
}
