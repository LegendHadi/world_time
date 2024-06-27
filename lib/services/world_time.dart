import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  late String location;
  late String time;
  late String flag;
  late String url;

  WorldTime({
    required this.location,
    required this.flag,
    required this.url,
  });

  Future<void> getData() async {
    Response response =
        await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);
    // print(data);
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 6);
    // print(datetime);
    // print(offset);
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
    time = now.toString();
    // print(now);
  }
}
