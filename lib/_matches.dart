import 'package:offdabreak/match_item.dart';
import 'package:offdabreak/pointdata.dart';

final List<MatchItem> matchesData = [
  MatchItem(
    id: "1",
    team1: "San Diego Dynasty",
    team2: "Houston Heat",
    date: DateTime.now(),
    hour12: 10,
    minute: 0,
    isPm: false,
    points: [
      PointData(
        id: 1,
        bunkers: ["snake 1", "alpha", "home", "box", "canada"],
        remainingMinutes: 15,
        remainingSeconds: 00,
      ),
      PointData(
        id: 2,
        bunkers: ["utah", "bravo", "snake 3", "seattle", "300"],
        remainingMinutes: 12,
        remainingSeconds: 47,
      ),
      PointData(
        id: 3,
        bunkers: ["dallas", "delta", "small dorito", "10", "100"],
        remainingMinutes: 9,
        remainingSeconds: 19,
      ),
    ],
  ),

  MatchItem(
    id: "2",
    team1: "Baltimore Arsenal",
    team2: "Edmonton Impact",
    date: DateTime.now(),
    hour12: 11,
    minute: 30,
    isPm: false,
    points: [
      PointData(
        id: 1,
        bunkers: ["miami", "home", "snake 2", "300", "bravo"],
        remainingMinutes: 15,
        remainingSeconds: 00,
      ),
      PointData(
        id: 2,
        bunkers: ["box", "200", "seattle", "alpha", "snake 4"],
        remainingMinutes: 13,
        remainingSeconds: 11,
      ),
      PointData(
        id: 3,
        bunkers: ["canada", "delta", "10", "california", "dallas"],
        remainingMinutes: 10,
        remainingSeconds: 52,
      ),
      PointData(
        id: 4,
        bunkers: ["small dorito", "100", "utah", "snake 1", "300"],
        remainingMinutes: 7,
        remainingSeconds: 06,
      ),
    ],
  ),

  MatchItem(
    id: "3",
    team1: "Chicago AfterShock",
    team2: "Tampa Bay Damage",
    date: DateTime.now(),
    hour12: 1,
    minute: 15,
    isPm: true,
    points: [
      PointData(
        id: 1,
        bunkers: ["alpha", "snake 3", "200", "100", "miami"],
        remainingMinutes: 15,
        remainingSeconds: 00,
      ),
      PointData(
        id: 2,
        bunkers: ["box", "snake 1", "dallas", "bravo", "seattle"],
        remainingMinutes: 11,
        remainingSeconds: 34,
      ),
      PointData(
        id: 3,
        bunkers: ["delta", "home", "california", "300", "canada"],
        remainingMinutes: 7,
        remainingSeconds: 02,
      ),
    ],
  ),

  MatchItem(
    id: "4",
    team1: "New Orleans Hurricanes",
    team2: "San Antonio X-Factor",
    date: DateTime.now(),
    hour12: 2,
    minute: 45,
    isPm: true,
    points: [
      PointData(
        id: 1,
        bunkers: ["snake 4", "small dorito", "200", "alpha", "box"],
        remainingMinutes: 15,
        remainingSeconds: 00,
      ),
      PointData(
        id: 2,
        bunkers: ["100", "utah", "snake 2", "10", "canada"],
        remainingMinutes: 11,
        remainingSeconds: 43,
      ),
      PointData(
        id: 3,
        bunkers: ["california", "seattle", "home", "dallas", "bravo"],
        remainingMinutes: 8,
        remainingSeconds: 07,
      ),
      PointData(
        id: 4,
        bunkers: ["miami", "300", "snake 1", "delta", "box"],
        remainingMinutes: 5,
        remainingSeconds: 58,
      ),
      PointData(
        id: 5,
        bunkers: ["snake 3", "canada", "alpha", "100", "seattle"],
        remainingMinutes: 2,
        remainingSeconds: 09,
      ),
    ],
  ),

  MatchItem(
    id: "5",
    team1: "Los Angeles Ironmen",
    team2: "Infamous",
    date: DateTime.now(),
    hour12: 4,
    minute: 10,
    isPm: true,
    points: [
      PointData(
        id: 1,
        bunkers: ["home", "delta", "snake 2", "box", "10"],
        remainingMinutes: 15,
        remainingSeconds: 00,
      ),
      PointData(
        id: 2,
        bunkers: ["snake 1", "snake 3", "200", "bravo", "100"],
        remainingMinutes: 13,
        remainingSeconds: 55,
      ),
      PointData(
        id: 3,
        bunkers: ["alpha", "300", "dallas", "miami", "seattle"],
        remainingMinutes: 9,
        remainingSeconds: 12,
      ),
    ],
  ),
  MatchItem(
    id: "6",
    team1: "NRG Elite",
    team2: "PaintballFIT",
    date: DateTime.now(),
    hour12: 5,
    minute: 00,
    isPm: true,
    points: [
      PointData(
        id: 1,
        bunkers: ["utah", "alpha", "bravo", "100", "box"],
        remainingMinutes: 15,
        remainingSeconds: 00,
      ),
      PointData(
        id: 2,
        bunkers: ["seattle", "300", "snake 1", "delta", "10"],
        remainingMinutes: 12,
        remainingSeconds: 44,
      ),
      PointData(
        id: 3,
        bunkers: ["miami", "200", "home", "small dorito", "snake 4"],
        remainingMinutes: 8,
        remainingSeconds: 19,
      ),
    ],
  ),

  MatchItem(
    id: "7",
    team1: "Royal City Seadogs",
    team2: "New York Xtreme",
    date: DateTime.now(),
    hour12: 6,
    minute: 20,
    isPm: true,
    points: [
      PointData(
        id: 1,
        bunkers: ["300", "snake 2", "home", "alpha", "bravo"],
        remainingMinutes: 15,
        remainingSeconds: 00,
      ),
      PointData(
        id: 2,
        bunkers: ["10", "box", "canada", "100", "miami"],
        remainingMinutes: 13,
        remainingSeconds: 57,
      ),
      PointData(
        id: 3,
        bunkers: ["delta", "snake 1", "200", "seattle", "dallas"],
        remainingMinutes: 10,
        remainingSeconds: 21,
      ),
      PointData(
        id: 4,
        bunkers: ["utah", "snake 3", "small dorito", "300", "bravo"],
        remainingMinutes: 7,
        remainingSeconds: 36,
      ),
    ],
  ),

  MatchItem(
    id: "8",
    team1: "Tampa Bay Damage",
    team2: "San Antonio X-Factor",
    date: DateTime.now(),
    hour12: 7,
    minute: 50,
    isPm: true,
    points: [
      PointData(
        id: 1,
        bunkers: ["alpha", "snake 3", "300", "box", "10"],
        remainingMinutes: 15,
        remainingSeconds: 00,
      ),
      PointData(
        id: 2,
        bunkers: ["canada", "bravo", "100", "utah", "california"],
        remainingMinutes: 11,
        remainingSeconds: 28,
      ),
      PointData(
        id: 3,
        bunkers: ["dallas", "home", "snake 4", "seattle", "miami"],
        remainingMinutes: 8,
        remainingSeconds: 03,
      ),
    ],
  ),

  MatchItem(
    id: "9",
    team1: "Houston Heat",
    team2: "Leverage",
    date: DateTime.now(),
    hour12: 8,
    minute: 45,
    isPm: true,
    points: [
      PointData(
        id: 1,
        bunkers: ["snake 4", "delta", "100", "box", "canada"],
        remainingMinutes: 15,
        remainingSeconds: 00,
      ),
      PointData(
        id: 2,
        bunkers: ["alpha", "snake 3", "10", "200", "utah"],
        remainingMinutes: 12,
        remainingSeconds: 13,
      ),
      PointData(
        id: 3,
        bunkers: ["seattle", "small dorito", "home", "bravo", "dallas"],
        remainingMinutes: 9,
        remainingSeconds: 55,
      ),
      PointData(
        id: 4,
        bunkers: ["300", "snake 2", "miami", "box", "california"],
        remainingMinutes: 6,
        remainingSeconds: 48,
      ),
    ],
  ),

  MatchItem(
    id: "10",
    team1: "Edmonton Impact",
    team2: "Los Angeles Ironmen",
    date: DateTime.now(),
    hour12: 9,
    minute: 10,
    isPm: true,
    points: [
      PointData(
        id: 1,
        bunkers: ["snake 1", "alpha", "home", "100", "delta"],
        remainingMinutes: 15,
        remainingSeconds: 00,
      ),
      PointData(
        id: 2,
        bunkers: ["300", "utah", "bravo", "small dorito", "box"],
        remainingMinutes: 14,
        remainingSeconds: 09,
      ),
      PointData(
        id: 3,
        bunkers: ["canada", "dallas", "snake 4", "seattle", "10"],
        remainingMinutes: 11,
        remainingSeconds: 42,
      ),
      PointData(
        id: 4,
        bunkers: ["200", "miami", "california", "snake 3", "300"],
        remainingMinutes: 7,
        remainingSeconds: 58,
      ),
    ],
  ),
];
