import 'package:flutter/material.dart';

class MatchSelect extends StatefulWidget {
  const MatchSelect({super.key});

  static List<String> items = [
    'Team A vs Team B',
    'Team C vs Team D',
    'Team E vs Team F',
    'Team G vs Team H',
  ];

  @override
  State<MatchSelect> createState() => _MatchSelectState();
}

class _MatchSelectState extends State<MatchSelect> {
  @override
  // ignore: dead_code
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Match Route"),
        backgroundColor: Color.fromARGB(255, 0, 225, 255),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            // would let us scroll
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: MatchSelect.items.map((item) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () => print("Pressed $item"),
                    child: Text(item),
                  ),
                );
              }).toList(),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(color: Colors.white),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Team A",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text("vs", textAlign: TextAlign.center),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(color: Colors.white),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Team B",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
