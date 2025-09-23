import 'package:flutter/material.dart';

class EventSelect extends StatelessWidget {
  const EventSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("offdabreak"),
        backgroundColor: const Color.fromARGB(255, 0, 225, 255),
      ),
      body: Stack(
        children: [ 
          Container(
                  height: 200,
                  width: double.infinity,
                  color: const Color.fromARGB(255, 0, 225, 255),
                  alignment: Alignment.center,
                  child: const Text(
                    "offdabreak",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
          // Scrollable content including the app bar
          SingleChildScrollView(
            child: Column(
              children: [
                // AppBar replacement as scrollable widget
                // Container(
                //   height: 200,
                //   width: double.infinity,
                //   color: const Color.fromARGB(255, 0, 225, 255),
                //   alignment: Alignment.center,
                //   child: const Text(
                //     "offdabreak",
                //     style: TextStyle(
                //       fontSize: 28,
                //       fontWeight: FontWeight.bold,
                //       color: Colors.white,
                //     ),
                //   ),
                // ),
                const SizedBox(height: 300),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    child: const Text('Second screen'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/second');
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(450, 80),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    child: const Text('Third screen'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/third');
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(450, 80),
                    ),
                  ),
                ),

                //delete
const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    child: const Text('Third screen'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/third');
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(450, 80),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    child: const Text('Third screen'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/third');
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(450, 80),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    child: const Text('Third screen'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/third');
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(450, 80),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    child: const Text('Third screen'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/third');
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(450, 80),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    child: const Text('Third screen'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/third');
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(450, 80),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    child: const Text('Third screen'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/third');
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(450, 80),
                    ),
                  ),
                ),

                
                //delete
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    child: const Text('Fourth screen'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/fourth');
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(450, 80),
                    ),
                  ),
                ),
                const SizedBox(height: 100), // extra space for floating button
              ],
            ),
          ),

          // Floating add button
          Positioned(
            bottom: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(20),
              ),
              child: const Icon(Icons.add),
            ),
          ),

          Center(
                  child: ElevatedButton(
                    child: const Text('Second screen'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/second');
                    },
                    style: ElevatedButton.styleFrom(
                    fixedSize: const Size(450, 80),
                    ),
                  ),
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  color: const Color.fromARGB(255, 0, 225, 255),
                  alignment: Alignment.center,
                  child: const Text(
                    "offdabreak",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),

        ],
      ),
    );
  }
}