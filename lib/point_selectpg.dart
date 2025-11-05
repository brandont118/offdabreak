import 'package:flutter/material.dart';

// Here is were we would. display each match set of points played in the match
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
            mainAxisExtent: 294,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                print("Clicked tile $index");
                // navigate or do something else
                Navigator.pushNamed(
                  context,
                  '/fourth',
                  arguments: items[index],
                );
              },
              //TODO: Here is where the preview image would be as well as which point is which
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 20,
                      width: double.maxFinite,
                      color: Colors.red,
                      child: Text(
                        'Team A',
                        textAlign: TextAlign.center,
                        ),
                    ),
                    RotatedBox(
                   quarterTurns: 1,
                  child: Image.asset('assets/lonestar_layout.png'),
                ),
                  //   Text(
                  //     items[index],
                  //     style: TextStyle(color: Colors.white, fontSize: 18),
                  // ),
                  Spacer(),
                  Container(
                      height: 20,
                      width: double.maxFinite,
                      color: Colors.lightBlue,
                      child: Text(
                        'Team B',
                        textAlign: TextAlign.center,
                        ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}