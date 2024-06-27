import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Map data;

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    print(data);
    return SafeArea(
      child: Column(
        children: [
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/location');
            },
            label: Text('edit location'),
            icon: Icon(Icons.edit_location),
          ),
        ],
      ),
    );
  }
}
