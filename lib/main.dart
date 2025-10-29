import 'package:flutter/material.dart';
import 'event_select.dart';
import 'match_select.dart';
import 'point_edit.dart';
import 'point_selectpg.dart';

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
        '/': (context) => EventSelect(),
        '/second': (context) => MatchSelect(),
        '/third': (context) =>  PointSelect(),
        '/fourth': (context) => PointEdit(),
      },
    ),
  );
}


//Moved to event_select.dart

//Moved to match_select.dart

//Moved to point_edit.dart

