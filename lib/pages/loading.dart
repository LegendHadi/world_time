import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Berlin', flag: 'GERMANY.jfif', url: 'Europe/Berlin');
    await instance.getData();
    if (instance.time == null) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/error');
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/home', arguments: instance);
    }
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'loading',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          SizedBox(height: 15),
          SpinKitSpinningLines(
            color: Colors.white,
            size: 70.0,
          ),
        ],
      ),
    );
  }
}
