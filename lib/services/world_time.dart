import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime {

  String location; // location name for UI
  String time; // the time in that location
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint
  bool isDayTime;

  WorldTime({ this.location, this.flag, this.url });

  Future<void> getTime() async {
    try {
      // make the request
      Response response = await get(
          'http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      // get properties from json
      String datetime = data['datetime'];
      String offset_hour = data['utc_offset'].substring(1, 3);
      String offset_minute = data['utc_offset'].substring(4, 6);


      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset_hour)));
      now = now.add(Duration(minutes: int.parse(offset_minute)));
      //print(now);

      // set the time property
      //print("hour:${now.hour}");
      isDayTime=now.hour>17 || now.hour<4 ? false:true;
      time = DateFormat.jm().format(now);
    }
    catch (e) {
      print("Caught ERROR :$e");
      time = 'Could not get time data..:(';
    }
  }
}

// WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');