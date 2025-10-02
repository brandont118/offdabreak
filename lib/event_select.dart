import 'package:flutter/material.dart';
import 'package:offdabreak/eventButton_format.dart';


class EventSelect extends StatelessWidget {
  const EventSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        titleTextStyle: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        // backgroundColor: Color.fromRGBO(70, 0, 0,1), //dark red
        backgroundColor: const Color.fromRGBO(8, 45, 115, 1),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: 250,
            width: double.infinity,
            color: const Color.fromARGB(8, 45, 115, 1),
            alignment: Alignment.center,
          ),

          // Scrollable content including the app bar
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 315),

                HomeButtonsColumn(
                  items: const [
                    HomeButtonSpec(
                      label: 'Tampa Bay',
                      route: '/second',
                      asset: 'assets/TampaBay.png',
                    ),
                    HomeButtonSpec(
                      label: 'Atlantic City',
                      route: '/second',
                      asset: 'assets/AtlanticCity.png',
                    ),
                    HomeButtonSpec(
                      label: 'Midwest',
                      route: '/third',
                      asset: 'assets/midwest.png',
                    ),
                    HomeButtonSpec(
                      label: 'Lone Star',
                      route: '/second',
                      asset: 'assets/LoneStar_Logo.png',
                    ),
                  ],
                ),
                const SizedBox(height: 100), // extra space for floating button
              ],
            ),
          ),

          // Floating add button (i dont think i want anymore)
          // Positioned(
          //   bottom: 20,
          //   right: 20,
          //   child: ElevatedButton(
          //     onPressed: () {},
          //     style: ElevatedButton.styleFrom(
          //       shape: const CircleBorder(),
          //       padding: const EdgeInsets.all(20),
          //     ),
          //     child: const Icon(Icons.add),
          //   ),
          // ),
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  // Color.fromRGBO(70, 0, 0,1), //dark red 
                  // Color.fromRGBO(96, 65, 65, 1),

                  Color.fromRGBO(8, 45, 115, 1), //dark blue
                  Color.fromRGBO(117, 128, 149, 1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),

              image: DecorationImage(
                image: AssetImage('assets/TransparentMan.png'),
                fit: BoxFit.cover,
                opacity: 0.3,
                alignment: Alignment(0, -0.9),
              ),

              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],

              // color: const Color.fromRGBO(8, 45, 115, 1),
              // image: DecorationImage(
              //   image: AssetImage("assets/TransparentMan.png"),
              //   fit: BoxFit.cover,
              //   alignment: Alignment(0,-0.9),
              // ),
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.black.withOpacity(0.3),
              //     spreadRadius: 2,
              //     blurRadius: 7,
              //     offset: const Offset(0, 3), // changes position of shadow
              //   ),
              // ],
            ),
            alignment: Alignment.center,
          ),

          //live event button
          Align(
            alignment:
                Alignment.topCenter, // Align the Column to the top center
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 205), // Maintain vertical spacing

                HomeButtonsColumn(
                  items: const [
                    HomeButtonSpec(
                      label: 'World Cup',
                      route: '/second',
                      asset: 'assets/WorldCup_Logo.png',
                    ),
                  ],
                ),
              ],
            ),
          ),

          //live container
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 189),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(219, 6, 49, 0.957),
                    borderRadius: BorderRadius.circular(500),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Text(
                    'live event',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromRGBO(255, 255, 255, 1),
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