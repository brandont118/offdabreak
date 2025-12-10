class PointData {
  PointData({
    required this.id,
    this.team1 = "Team A",
    this.team2 = "Team B",
    this.winner = "TBD",
    List<String>? bunkers,
    this.remainingMinutes = 15,
    this.remainingSeconds = 0,
    this.isLastPoint = false,
  }) : bunkers = bunkers ?? [];

  final int id;
  String? winner;
  String? team1;
  String? team2;
  int remainingMinutes;
  int remainingSeconds;
  bool isLastPoint;

  final List<String> bunkers;

  String get remainingTimeText =>
      '${remainingMinutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';

  int get minutes => remainingMinutes;
}
