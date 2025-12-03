import 'package:flutter/material.dart';
import 'pointdata.dart';

// Sample data for points comes from match_select

class PointSelect extends StatefulWidget {
  const PointSelect({super.key});

  @override
  State<PointSelect> createState() => _PointSelectState();
}

class _PointSelectState extends State<PointSelect> {
  // * ====Data From match_select screen====
  late final pointScreen = ModalRoute.of(context)!.settings.arguments as Map;

  late final List<PointData> _pointdata = pointScreen['point'];
  late final String team1 = pointScreen['t1'];
  late final String team2 = pointScreen['t2'];
  //late final Map<int, Map<String, dynamic>> _pointdata = pointScreen['point'];
  //late final String imagePath = matchScreen['image'];
  // * ====Data From match_select screen====

  @override
  Widget build(BuildContext context) {
  //   final points = _pointdata.keys.toList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context, _pointdata);
          },
        ),
        title: const Text("Point Viewer"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Add Point',
            onPressed: () {
              setState(() {
                if (_pointdata.isEmpty){
                  _pointdata.add(PointData(id: 1));
                } else {
                  _pointdata.add(PointData(id: _pointdata.length+1));
                }
              });
            },
          ),
        ],
      ),
      // * Each Sepearte Point
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
  itemCount: _pointdata.length,
  itemBuilder: (context, index) {
    final point = _pointdata[index];
    return ListTile(
      title: Text("Point ${point.id}"),
      subtitle: Text("Winner: ${point.winner}"),
      trailing: Text("Bunkers: ${point.bunkers}"),
      onTap: () {
        Navigator.pushNamed(
          context,
          '/fourth',
           arguments: {'point':point, "t1": team1, "t2": team2}
        );
      },
    );
  },
)
  //       child: GridView.builder(
  //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //           crossAxisCount: 2,
  //           crossAxisSpacing: 10,
  //           mainAxisSpacing: 10,
  //           mainAxisExtent: 345,
  //         ),
  //         itemCount: points.length,
  //         itemBuilder: (context, index) {
  //           final pointNum = points[index];
  //           final point = _pointdata[pointNum]!;

  //           return InkWell(
  //             onTap: () {
  //               Navigator.pushNamed(
  //                 context,
  //                 '/fourth',
  //                 arguments: pointNum,
  //               );
  //             },
  //             child: Container(
  //               decoration: BoxDecoration(
  //                 color: Colors.grey[200],
  //                 borderRadius: BorderRadius.circular(12),
  //               ),
  //               padding: const EdgeInsets.all(12),
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   Text(
  //                     'Point $pointNum',
  //                     style: const TextStyle(
  //                         fontSize: 20, fontWeight: FontWeight.bold),
  //                   ),
  //                   const SizedBox(height: 8),
  //                    ClipRect(
  //                 child: Align(
  //                   alignment: Alignment.center,
  //                   heightFactor: 0.81,
  //                   child: RotatedBox(
  //                     quarterTurns: 1,
  //                     child: Image.asset('assets/lonestar_layout.png'),
  //                   ),
  //                 ),
  //               ),
  //                   Text(
  //                     'Winner: ${point['winner'] ?? "TBD"}',
  //                     style: const TextStyle(fontSize: 16),
  //                   ),
  //                   const SizedBox(height: 4),
  //                   Text(
  //                     'Bunkers: ${point['bunkers'].isEmpty ? "None" : point['bunkers'].join(", ")}',
  //                     textAlign: TextAlign.center,
  //                     style: const TextStyle(fontSize: 14),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           );
  //         },
        // ),
      
      ),
    );
  }
}
