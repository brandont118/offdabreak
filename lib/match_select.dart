import 'package:flutter/material.dart';

// ignore: camel_case_types
class MatchSelect extends StatelessWidget {
  const MatchSelect({super.key});

  @override
  // ignore: dead_code
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Match Route"),
        backgroundColor: Color.fromARGB(255, 0, 225, 255),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ), // ElevatedButton
      ),
    );
  }
}