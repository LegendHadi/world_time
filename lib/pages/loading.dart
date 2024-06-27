import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getData() async {
    Response response = await get(
        Uri.parse('http://worldtimeapi.org/api/timezone/America/Toronto'));
    Map data = jsonDecode(response.body);
    print(data);
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 6);
    print(datetime);
    print(offset);
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
    print(now);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('loading screen'),
    );
  }
}
