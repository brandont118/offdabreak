import 'dart:math';
import 'package:offdabreak/match_item.dart';
import 'package:offdabreak/pointdata.dart';

// Original team names
final List<String> teams = [
  "Red Legion",
  "PaintballFIT",
  "Edmonton Impact",
  "San Antonio X-Factor",
  "Tampa Bay Damage",
  "Ton Ton FSU",
  "Houston Heat",
  "New Orleans Hurricanes",
  "Baltimore Arsenal",
  "Infamous",
  "ac DIESEL",
  "Leverage",
  "Royal City Seadogs",
  "San Diego Dynasty",
  "Los Angeles Ironmen",
  "Chicago AfterShock",
  "Seattle Uprising",
  "ASG Aftermath",
  "New York Xtreme",
  "NRG Elite",
];

final List<String> bunkersList = [
  "snake 1", "snake 2", "snake 3", "snake 4",
  "california", "home", "seattle", "alpha",
  "10", "bravo", "box", "utah", "canada",
  "100", "200", "300", "small dorito", "miami",
  "dallas", "delta",
];

final Random _random = Random();

// Function to generate a single point
PointData generatePoint(int id, String team1, String team2, {bool isLast = false}) {
  String winner = _random.nextBool() ? team1 : team2;
  int minutes = 1 + _random.nextInt(15);
  int seconds = _random.nextInt(60);

  List<String> bunkers = List.from(bunkersList)..shuffle(_random);
  bunkers = bunkers.sublist(0, 5);

  return PointData(
    id: id,
    bunkers: bunkers,
    remainingMinutes: minutes,
    remainingSeconds: seconds,
    winner: winner,
    isLastPoint: isLast,
  );
}

// Function to generate all matches
List<MatchItem> generateMatches() {
  final List<MatchItem> matchesData = [];

  for (int i = 0; i < teams.length; i += 2) {
    if (i + 1 >= teams.length) break; // prevent overflow
    String team1 = teams[i];
    String team2 = teams[i + 1];

    int numPoints = 3 + _random.nextInt(3); // 3-5 points
    List<PointData> points = List.generate(numPoints, (index) {
      bool isLast = index == numPoints - 1;
      return generatePoint(index + 1, team1, team2, isLast: isLast);
    });

    matchesData.add(
      MatchItem(
        id: "${i ~/ 2 + 1}",
        team1: team1,
        team2: team2,
        date: DateTime.now(),
        hour12: 10 + (i ~/ 2) % 12,
        minute: _random.nextInt(60),
        isPm: (i ~/ 2) % 2 == 1,
        points: points,
      ),
    );
  }

  return matchesData;
}

// Call the function to get the final list
final List<MatchItem> matchesData = generateMatches();
