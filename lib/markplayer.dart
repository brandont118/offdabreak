import 'package:flutter/material.dart';
import 'package:offdabreak/point_edit.dart';

//ignore: must_be_immutable
class Markplayer extends StatefulWidget {
  final double x;
  final double y;
  final String bunkerName;
  final bool visible;

  bool isVisible = false;

  Markplayer(
    this.x,
    this.y,
    this.bunkerName, {
    this.visible = false,
    super.key,
  }) {
    isVisible = visible;
  }

  void save() {
    print('$bunkerName saved: $isVisible');
  }

  Widget buildWithLimit(
    BuildContext context,
    int currentActive, {
    required int maxActive,
    required VoidCallback onChange,
  }) {
    return Positioned(
      top: -12 + (35 * y),
      left: -10 + (35 * x),
      child: StatefulBuilder(
        builder: (context, setStateLocal) {
          return GestureDetector(
            onTap: () {
              setStateLocal(() {
                isVisible = !isVisible;
              });

              if (isVisible && currentActive >= maxActive) {
                setStateLocal(() {
                  isVisible = !isVisible;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Only $maxActive bunker spots can be active.',
                    ),
                    duration: Duration(seconds: 1),
                  ),
                );
                return;
              }

              if (isVisible) {
                locations.add(bunkerName);
              } else {
                locations.removeWhere((item) => item == bunkerName);
              }

              print("locations updated: $locations");
              onChange();
            },
            child: AnimatedOpacity(
              opacity: isVisible ? 1.0 : 0.15,
              duration: Duration(milliseconds: 100),
              child: Icon(
                Icons.clear,
                color: isVisible ? Colors.black : Colors.grey.shade400,
                size: 30,
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  State<Markplayer> createState() => _MarkplayerState();
}

class _MarkplayerState extends State<Markplayer> {
  @override
  Widget build(BuildContext context) {
    return Container(); // unused; we build with buildWithLimit
  }
}
