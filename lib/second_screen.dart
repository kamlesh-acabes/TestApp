import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pick an option')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, 'ArabiMobile');
                },
                child: const Text('ArabiMobile'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, 'ArabiNext');
                },
                child: const Text('ArabiNext'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              child: Row(
                children: [
                  Material(
                    color: Colors.yellow,
                    child: SizedBox(height: 50, width: 50,)
                  ),
                  Spacer(),
                  Material(
                      color: Colors.red,
                      child: SizedBox(height: 50, width: 50,)
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}