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
    data = ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    String bgImage = data['isDayTime'] ? 'day.jfif' : 'night.jfif';

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 120),
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/$bgImage'),
          fit: BoxFit.cover,
        )),
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/location');
              },
              label: const Text('edit location'),
              icon: const Icon(Icons.edit_location),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data['location'],
                  style: const TextStyle(
                    fontSize: 28,
                    letterSpacing: 2,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              data['time'],
              style: const TextStyle(
                fontSize: 66,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
