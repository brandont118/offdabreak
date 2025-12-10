import 'package:flutter/material.dart';
import 'pointdata.dart';

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

  // * ====Data From match_select screen====

  @override
  Widget build(BuildContext context) {
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
                if (_pointdata.isEmpty) {
                  _pointdata.add(PointData(id: 1));
                } else {
                  _pointdata.add(PointData(id: _pointdata.length + 1));
                }
              });
            },
          ),
        ],
      ),
      // * Each Sepearte Point
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            mainAxisExtent: 380,
          ),
          itemCount: _pointdata.length,
          itemBuilder: (context, index) {
            final point = _pointdata[index];
            return InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/fourth',
                  arguments: {'point': point, "t1": team1, "t2": team2},
                );
              },
              onLongPress: () {
                setState(() {
                  _pointdata.removeAt(index);
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: point.isLastPoint
                      ? Colors.grey[400]
                      : Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Point ${point.id}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ClipRect(
                      child: Align(
                        alignment: Alignment.center,
                        heightFactor: 0.81,
                        child: RotatedBox(
                          quarterTurns: 1,
                          child: Image.asset('assets/lonestar_layout.png'),
                        ),
                      ),
                    ),
                    SizedBox(height: 3),
                    // ! Fix Font size adjustment to shrink when needed
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final fontSize =
                            constraints.maxWidth / 20; // adjust ratio
                        return Text(
                          'Winner: ${point.winner}',
                          style: TextStyle(
                            fontSize: fontSize.clamp(12, 18),
                          ), // min 12, max 18
                          textAlign: TextAlign.center,
                        );
                      },
                    ),

                    const SizedBox(height: 3),
                    Text(
                      point.bunkers.isEmpty
                          ? "No Bunkers!"
                          : 'Bunkers: ${point.bunkers.join(", ")}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 13),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'Time Left: ${point.remainingTimeText}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
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
