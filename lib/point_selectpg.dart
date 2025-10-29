import 'package:flutter/material.dart';

// Here is were we would. display each match set of points played in the match
// TODO: Set up a grid 2 wide
// TODO: Add an Add point button that takes in the new data of ( Who wins, Where players went).
class PointSelect extends StatefulWidget {
  const PointSelect({super.key});

  @override
  State<PointSelect> createState() => _PointSelectState();
}

class _PointSelectState extends State<PointSelect> {
  final List<String> items = List.generate(20, (i) => "Item $i");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Point Viewer"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
  ),
  itemCount: items.length,
  itemBuilder: (context, index) {
    return InkWell(
      onTap: () {
        print("Clicked tile $index");
        // navigate or do something else
        Navigator.pushNamed(context, '/fourth', arguments: items[index]);
      },
      child: Container( //TODO: Here is where the preview image would be as well as which point is which
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            items[index],
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  },
),
      ),
    );
  }
}