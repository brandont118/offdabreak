import 'package:flutter/material.dart';


//Test data
// ignore: non_constant_identifier_names
Map<int, List<String>> point_data = {
  1: ['home','snake 1', 'utah'],
};


// have an on tap to mark a person
// make it so that it is draggble possible
// possible drawing functions
class PointEdit extends StatelessWidget {
  PointEdit({super.key});

  final List<markplayer> bunkerspots = [ // TODO: Find a way to choose which side they are shooting left/right
  markplayer(2.2, 1.3, 'snake 1'),
  markplayer(1.7, 4, 'snake 2'), 
  markplayer(1.7, 5, 'snake 3'),
  markplayer(1.6, 6.6, 'snake 4'),
  markplayer(4, 1, 'california'),
  markplayer(6, 1, 'home'),
  markplayer(5.3, 2.8, 'seattle'),
  markplayer(4.5, 5.7, 'alpha'),
  markplayer(6.1, 5.7, '10'),
  markplayer(7.45, 7.3, 'bravo'),
  markplayer(4, 3.5, 'box'),
  markplayer(8, 1, "utah"),
  markplayer(7.15, 4.8, 'canada'),
  markplayer(9.7, 1.5, '100'),
  markplayer(9.7, 3.8, '200'),
  markplayer(9.7, 6, '300'),
  markplayer(8.5, 2.5, 'small dorito'),
  markplayer(10.3, 2.5, 'miami'),
  markplayer(10.4, 4.6, 'dallas'),
  markplayer(10.5, 7.2, 'delta')
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scout Report'),
        actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add_box),
              tooltip: 'Search',
              onPressed: () {
                //create a class function that saves the data into point_data.
                print('add button pressed');
                for (var bunker in bunkerspots) {
                  bunker.save();
                }
              },
            ),
      ],
      ),
      body: Stack(
        children: [
              RotatedBox( // TODO: Make a draggble icon 
              quarterTurns: 1, // Rotate by 45 degrees (pi/4 radians)
              child: Image(
                image: AssetImage('assets/lonestar_layout.png'),
              ),
            ),
          for (int i = 0; i < bunkerspots.length; i++) // outputs each mark for the bunker spots
            bunkerspots[i],
        ],
      ),

      
    );
  }
}



// ignore: non_constant_identifier_names
class markplayer extends StatefulWidget {
  final double x;
  final double y;
  final String bunkerName;
  final bool visible;

  markplayer(this.x, this.y,this.bunkerName ,{ this.visible = false, super.key});

  void save(){
    print(visible);
  }

  @override
  State<markplayer> createState() => _markplayerState();
}

class _markplayerState extends State<markplayer> {
  late bool isVisible = widget.visible;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 28+31*widget.y, // math for grid cordinates
      left: -4+31*widget.x, //every 31 pixels moves to the grid by 1.
     child: GestureDetector(
        onTap: () {
          setState(() {
            isVisible = !isVisible;
          });
          print('${widget.bunkerName} isVisible = $isVisible');
        },
        child: AnimatedOpacity(
          opacity: isVisible ? 1.0 : 0.15, // Slightly visible when hidden
          duration: const Duration(milliseconds: 100),
          child: Icon(
            Icons.clear,
            color: isVisible ? const Color.fromARGB(255, 0, 0, 0) : Colors.grey.shade400,
            size: 30,
          ),
        ),
      ),
    );
  }
}
// class scoutreport extends StatefulWidget {
//   const scoutreport({super.key});

//   @override
//   State<scoutreport> createState() => _scoutreportState();
// }

// class _scoutreportState extends State<scoutreport> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }