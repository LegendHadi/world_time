import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late String location;
  late String? time;
  late String flag;
  late String url;
  late bool? isDayTime;

  WorldTime({
    required this.location,
    required this.flag,
    required this.url,
  });

  Future<void> getData() async {
    try {
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 6);
      DateTime now = DateTime.parse(datetime);
      if (data['utc_offset'].toString().startsWith('+')) {
        now = now.add(Duration(
            hours: int.parse(offset.split(':').first),
            minutes: int.parse(offset.split(':').last)));
      } else {
        now = now.subtract(Duration(
            hours: int.parse(offset.split(':').first),
            minutes: int.parse(offset.split(':').last)));
      }
      isDayTime = now.hour > 6 && now.hour < 19 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      time = null;
      isDayTime = null;
    }
  }
}
