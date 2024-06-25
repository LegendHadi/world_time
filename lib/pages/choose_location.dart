import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  void getData() async {
    String username = await Future.delayed(Duration(seconds: 3), () {
      return 'hadi';
    });

    String bio = await Future.delayed(Duration(seconds: 2), () {
      return 'musician';
    });
    print('$username - $bio');

    // await Future.delayed(Duration(seconds: 3), () {
    //   print('hadi');
    // });

    // Future.delayed(Duration(seconds: 2), () {
    //   print('musician');
    // });
    // print('statment');
  }

  @override
  void initState() {
    super.initState();
    getData();
    print('hey there');
  }

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text('Choose a Location'),
          centerTitle: true,
          backgroundColor: Colors.blue[900],
          elevation: 0,
        ),
        body: ElevatedButton(
          onPressed: () {
            setState(() {
              counter += 1;
            });
          },
          child: Text('counter is $counter'),
        ));
  }
}
