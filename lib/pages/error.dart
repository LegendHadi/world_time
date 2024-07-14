import 'package:flutter/material.dart';

class Error extends StatelessWidget {
  const Error({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.warning_amber_outlined,
              color: Colors.red,
              size: 200,
            ),
            const Text(
              'Can not get time data',
              style: TextStyle(
                fontSize: 30,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 85),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.amber),
              ),
              child: const Text(
                'Retry',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}