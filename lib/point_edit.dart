import 'package:flutter/material.dart';
import 'package:offdabreak/markplayer.dart';
import 'pointdata.dart';

//Test data
// ignore: non_constant_identifier_names

List<String> locations = [];

// make it so that it is draggable possible
// possible drawing functions
class PointEdit extends StatefulWidget {
  final int? pointNumber; // null if new point

  const PointEdit({super.key, this.pointNumber});

  @override
  State<PointEdit> createState() => _PointEditState();
}

class _PointEditState extends State<PointEdit> {
  // * Data from point_selectpg
  late PointData _pointdata;
  late String team1;
  late String team2;
  late Map pointdata;

  bool _loaded = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_loaded) {
      pointdata = ModalRoute.of(context)!.settings.arguments as Map;

      _pointdata = pointdata['point'];
      team1 = pointdata['t1'];
      team2 = pointdata['t2'];

      // Load bunker data
      locations.clear();
      locations.addAll(_pointdata.bunkers);

      // mark each bunker visible if it was selected previously
      for (var b in bunkerspots) {
        b.isVisible = locations.contains(b.bunkerName);
      }

      _loaded = true;
    }
  }

  // * Data from point_selectpg
  final List<Markplayer> bunkerspots = [
    Markplayer(2.2, 1.3, 'snake 1'),
    Markplayer(1.7, 4, 'snake 2'),
    Markplayer(1.8, 5, 'snake 3'),
    Markplayer(1.6, 6.6, 'snake 4'),
    Markplayer(4, 1, 'california'),
    Markplayer(6, 1, 'home'),
    Markplayer(5.3, 2.8, 'seattle'),
    Markplayer(4.5, 5.7, 'alpha'),
    Markplayer(6.1, 5.6, '10'),
    Markplayer(7.45, 7.3, 'bravo'),
    Markplayer(4, 3.4, 'box'),
    Markplayer(8, 1, "utah"),
    Markplayer(7.15, 4.8, 'canada'),
    Markplayer(9.7, 1.5, '100'),
    Markplayer(9.7, 3.8, '200'),
    Markplayer(9.7, 6, '300'),
    Markplayer(8.7, 2.5, 'small dorito'),
    Markplayer(10.3, 2.5, 'miami'),
    Markplayer(10.4, 4.6, 'dallas'),
    Markplayer(10.5, 7.2, 'delta'),
  ];

  String? winner;

  // Remaining game time
  int remainingMinutes = 15;
  int remainingSeconds = 0;

  // Last point toggle
  bool isLastPoint = false;

  String get remainingTimeText =>
      '${remainingMinutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';

  int get activeBunkerCount => bunkerspots.where((b) => b.isVisible).length;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scout Report'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_box),
            tooltip: 'Save',
            onPressed: () {
              // Save active bunkers
              // final activeBunkers = bunkerspots
              //     .where((b) => b.isVisible)
              //     .map((b) => b.bunkerName)
              //     .toList();

              // final pn =
              //     widget.pointNumber ??
              //     (point_data.keys.isEmpty ? 1 : point_data.keys.last + 1);

              // point_data[pn] = [winner ?? 'A', ...activeBunkers];

              // print(
              //   'Point $pn saved: Winner: $winner, Active Bunkers: $activeBunkers',
              // );
              //*saves bunker locationss to class
              print(locations);
              _pointdata.bunkers.clear();
              _pointdata.bunkers.addAll(locations);
              //*saves bunker locationss --end
              locations.clear();

              Navigator.pop(context, _pointdata); // go back
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipRect(
                  child: Align(
                    alignment: Alignment.center,
                    heightFactor: 0.82,
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: Image.asset('assets/lonestar_layout.png'),
                    ),
                  ),
                ),
                // initialize visibility from locations
                // then build widgets
                for (var bunker in bunkerspots)
                  bunker.buildWithLimit(
                    context,
                    activeBunkerCount,
                    maxActive: 5,
                    onChange: () {
                      setState(() {});
                    },
                  ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                print(locations);
              },
              child: Text("press"),
            ), //debug
            SizedBox(height: 15),

            // * Winner selection --start
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Winner : "),
                  SizedBox(width: 20),

                  // Team A button
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: _pointdata.winner == team1
                          ? Colors.green
                          : Colors.grey[300],
                      foregroundColor: _pointdata.winner == team1
                          ? Colors.white
                          : Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        _pointdata.winner = team1;
                      });
                    },
                    child: Text(team1),
                  ),

                  SizedBox(width: 10),

                  // Team B button
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: _pointdata.winner == team2
                          ? Colors.green
                          : Colors.grey[300],
                      foregroundColor: _pointdata.winner == team2
                          ? Colors.white
                          : Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        _pointdata.winner = team2;
                      });
                    },
                    child: Text(team2),
                  ),
                ],
              ),
            ),
            // * Winner selection --end
            SizedBox(height: 15),

            // * Game time selector --start
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Game Time Left: "),
                  DropdownButton<int>(
                    value: remainingMinutes,
                    items: List.generate(16, (index) => index)
                        .map(
                          (min) => DropdownMenuItem(
                            value: min,
                            child: Text(min.toString().padLeft(2, '0')),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        remainingMinutes = value!;
                      });
                    },
                  ),
                  Text(":"),
                  DropdownButton<int>(
                    value: remainingSeconds,
                    items: List.generate(60, (index) => index)
                        .map(
                          (sec) => DropdownMenuItem(
                            value: sec,
                            child: Text(sec.toString().padLeft(2, '0')),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        remainingSeconds = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
            // * Game time selector --end
            SizedBox(height: 15),

            // * Last Point toggle --start
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Last Point? "),
                  Switch(
                    value: isLastPoint,
                    onChanged: (value) {
                      setState(() {
                        isLastPoint = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            // * Last Point toggle --end
            SizedBox(height: 15),

            // Display current selection
            Text(
              "Remaining Time: $remainingTimeText",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "Is Last Point? ${isLastPoint ? "Yes" : "No"}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
