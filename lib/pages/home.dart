import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, dynamic> data = {};
  bool isFirstTime = true;

  @override
  Widget build(BuildContext context) {
    // data = data.isNotEmpty
    //     ? data
    //     : ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    if (isFirstTime) {
      isFirstTime = false;
      data = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    }

    String bgImage = data['isDayTime'] ? 'day.jfif' : 'night.jfif';
    Color textColor = data['isDayTime'] ? Colors.black : Colors.blue;
    Color editLocationColor = data['isDayTime'] ? Colors.brown : Colors.white;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 100),
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/$bgImage'),
          fit: BoxFit.cover,
        )),
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: () async {
                final result = await Navigator.pushNamed(context, '/location')
                    as Map<String, dynamic>?;
                if (result != null) {
                  setState(() {
                    data = result;
                  });
                }
              },
              label: Text(
                'edit location',
                style: TextStyle(
                  color: editLocationColor,
                  fontSize: 20,
                ),
              ),
              icon: Icon(
                Icons.edit_location,
                color: editLocationColor,
              ),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.transparent),
                shadowColor: WidgetStateProperty.all(Colors.transparent),
              ),
            ),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data['location'],
                  style: TextStyle(
                    fontSize: 35,
                    letterSpacing: 2,
                    color: textColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              data['time'],
              style: TextStyle(
                fontSize: 66,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
