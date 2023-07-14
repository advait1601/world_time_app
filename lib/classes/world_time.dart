import 'package:http/http.dart';
import 'dart:convert'; //enables us to decode json strings
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time = '';
  String flag; //url to an asset flag icon
  String url; //location url for an api endpoint
  String timeOfDay = ''; //morning, noon, evening, night

  //when WorldTime instance is created, properties - location, flag and the url will be passed
  //the time property will be set by calling the getTime() function
  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      Response response = await get(Uri.http('worldtimeapi.org', '/api/timezone/$url'));
      Map data = jsonDecode(response.body); //response.body is a string
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      //creating DateTime object
      //now - current time in timezone Europe/London
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      if (now.hour > 6 && now.hour < 12) {
        timeOfDay = 'morning';
      }
      else if (now.hour >= 12 && now.hour <= 16) {
        timeOfDay = 'noon';
      }
      else if (now.hour > 16 && now.hour <= 19) {
        timeOfDay = 'evening';
      }
      else {
        timeOfDay = 'night';
      }

      //this method enables us to format the time into a more readable format
      time = DateFormat.jm().format(now);
    }
    catch (e) { //if the url is invalid
      print('caught error!');
    }
  }
}