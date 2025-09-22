import 'package:flutter/material.dart';

class EventSelect extends StatelessWidget {
  const EventSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('offdabreak'),
        backgroundColor: Color.fromARGB(255, 0, 225, 255),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Center(
            child: ElevatedButton(
              child: const Text('Second screen'),
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              child: const Text('Third screen'),
              onPressed: () {
                Navigator.pushNamed(context, '/third');
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              child: const Text('fourth screen'),
              onPressed: () {
                Navigator.pushNamed(context, '/third');
              },
            ),
          ),
        ],
      ),
    );
  }
}
