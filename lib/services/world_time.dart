import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String flag;
  String url;
  bool isDayTime;

  WorldTime({ this.location, this.flag, this.url, this.isDayTime});

  Future<void> getTime() async {

    try {
      //request data from api
      Response response = await get(
          'http://worldtimeapi.org/api/timezone/$url');
      Map data = json.decode(response.body);
      //print(data);

      //get properties from data
      String dateTime = data['datetime'];
      String offsetH = data['utc_offset'].substring(1, 3);
      String offsetM = data['utc_offset'].substring(4, 6);

      //create datetime obj
      DateTime now = DateTime.parse(dateTime);
      int h = int.parse(offsetH);
      int m = int.parse(offsetM);
      now = now.add(Duration(hours: h, minutes: m));

      isDayTime = now.hour > 6 && now.hour < 18 ? true: false;
      time = DateFormat.jm().format(now);
    }
    catch(e){
      print('Error caught: $e');
      time = 'Could not load time';
    }
  }
}