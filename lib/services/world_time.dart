import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {

  String location;
  String time; // the time in that location
  String flag;
  String url;

  WorldTime({ this.location, this.flag, this.url});

  Future<void> getTime() async {

    try {
      Response response = await get("http://worldtimeapi.org/api/timezone/$url");
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'];
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(
          hours: int.parse(offset.substring(1,3)),
          minutes: int.parse(offset.substring(4,6))
      ));

      // set time property
      time = now.toString();
    }
    catch(e) {
      print("Error found $e");
      time = "Couldn't get time";
    }

  }


}
