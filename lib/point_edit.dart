import 'package:flutter/material.dart';

class PointEdit extends StatelessWidget {
  const PointEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Third Route"),
        backgroundColor: Color.fromARGB(255, 0, 225, 255),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Image(
              image: NetworkImage(
                'https://pbleagues.com/uploads/layouts/8927/1-NXL_2025-TEXAS_2d.jpg',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Go back!'),
          ),
        ],
      ),
    );
  }
}