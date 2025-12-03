import 'pointdata.dart';

// ====== DATA MODEL ======
class MatchItem {
  MatchItem({
    required this.id,
    required this.team1,
    required this.team2,
    required this.date,
    required this.hour12,
    required this.minute,
    required this.isPm,
    List<PointData>? points,
  }): points = points ?? [];

  final String id;
  final String team1;
  final String team2;
  final DateTime date;
  final int hour12;
  final int minute;
  final bool isPm;
  final List<PointData> points;

  DateTime get dateTime {
    int h24 = hour12 % 12 + (isPm ? 12 : 0);
    return DateTime(date.year, date.month, date.day, h24, minute);
  }

  String get timeLabel {
    final hh = hour12.toString().padLeft(2, '0');
    final mm = minute.toString().padLeft(2, '0');
    return "$hh:$mm ${isPm ? 'pm' : 'am'}";
  }

  String get label => "$team1 vs $team2";
}