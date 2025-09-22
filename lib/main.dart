import 'package:flutter/material.dart';
import 'event_select.dart';

// void main() {
//   runApp(const MyApp());
// }

void main() {
  runApp(
    MaterialApp(
      title: 'Named Routes',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const EventSelect(),
        '/second': (context) => const secondRoute(),
        '/third': (context) => const thirdRoute(),
      },
    ),
  );
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'offdabreak',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//       ),
//       home: const MyHomePage(title: 'offdabreak'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {

//   @override
//   Widget build(BuildContext context) {
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//        backgroundColor: Color.fromARGB(255, 0, 225, 255),
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Transform.rotate(
//           angle: 1.5708, // 90 degrees in radians
//           child: Image(
//             image: NetworkImage('https://pbleagues.com/uploads/layouts/8927/1-NXL_2025-TEXAS_2d.jpg'),
//           ),
//         ),
//       ),
//     );
//   }
// }


//Moved to event_select.dart

// ignore: camel_case_types
class secondRoute extends StatelessWidget {
  const secondRoute({Key? key}) : super(key: key);

  @override
  // ignore: dead_code
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GFG Second Route"),
        backgroundColor: Color.fromARGB(255, 0, 225, 255),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ), // ElevatedButton
      ),
    );
  }
}

// ignore: camel_case_types
class thirdRoute extends StatelessWidget {
  const thirdRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GFG Third Route"),
        backgroundColor: Color.fromARGB(255, 0, 225, 255),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Image(
              image: NetworkImage(
                'https://pbleagues.com/uploads/layouts/8927/1-NXL_2025-TEXAS_2d.jpg',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Go back!'),
          ),
        ],
      ),
    );
  }
}
