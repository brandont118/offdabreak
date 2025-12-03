import 'package:flutter/material.dart';
import 'match_item.dart';
import 'pointdata.dart';

//event buttons
class HomeButtonSpec {
  final String label;
  final String route;
  final IconData? icon; // optional built-in icon
  final String? asset; // optional image asset (png/svg)

  const HomeButtonSpec({
    required this.label,
    required this.route,
    this.icon,
    this.asset,
  });
}

//button format perm style
class HomeButton extends StatefulWidget {
  final HomeButtonSpec spec;

  const HomeButton({super.key, required this.spec});

  @override
  State<HomeButton> createState() => _HomeButtonState();
}

class _HomeButtonState extends State<HomeButton> {
  final List<MatchItem> _matches = [
    MatchItem(
      // Dummy data
      id: "1",
      team1: "Team A",
      team2: "Team B",
      date: DateTime.now(),
      hour12: 10,
      minute: 0,
      isPm: false,
      points: [
      PointData(id: 1,winner: "ME", bunkers: ['home']),
      PointData(id: 2),
      PointData(id: 3),
    ],
    ),
    MatchItem(
      // Dummy data
      id: "2",
      team1: "Team C",
      team2: "Team D",
      date: DateTime.now(),
      hour12: 11,
      minute: 0,
      isPm: false,
      points: [
      PointData(id: 1, winner: "ME"),
      PointData(id: 2),
      PointData(id: 3),
      PointData(id: 4),
    ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      //box shadow for buttons
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(500),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),

        child: ElevatedButton(
          onPressed: () async {
            Navigator.pushNamed(
              context,
              widget.spec.route,
              arguments: {'match': _matches, 'image': widget.spec.asset!},
            );
          },
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(400, 90),

            // color black for dark theme
            // backgroundColor: const Color.fromRGBO(59,59,59, 1),
          ),

          child: Stack(
            alignment: Alignment.center, // centers the text
            children: [
              // Left-side icon or asset
              if (widget.spec.icon != null)
                Positioned(
                  left: 5, // padding from left
                  child: Icon(widget.spec.icon, size: 40),
                )
              else if (widget.spec.asset != null)
                Positioned(
                  left: 1,
                  child: Image.asset(widget.spec.asset!, height: 40),
                ),

              // Centered text
              Center(
                child: Text(
                  widget.spec.label,
                  style: const TextStyle(
                    fontSize: 17,
                    // fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//button spacing column
class HomeButtonsColumn extends StatelessWidget {
  final List<HomeButtonSpec> items;
  final double gap;

  const HomeButtonsColumn({super.key, required this.items, this.gap = 20});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < items.length; i++) ...[
          HomeButton(spec: items[i]),
          if (i != items.length - 1) SizedBox(height: gap),
        ],
      ],
    );
  }
}
