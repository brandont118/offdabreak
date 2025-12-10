import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'match_item.dart';

//moved MatchItem to seperate folder

// ====== SCREEN ======
class MatchSelect extends StatefulWidget {
  const MatchSelect({super.key});

  static List<String> teams = const [
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

  static List<String> ap = const ['am', 'pm'];

  @override
  State<MatchSelect> createState() => _MatchSelectState();
}

class _MatchSelectState extends State<MatchSelect> {
  // ====Data From previous screen====
  late final matchScreen = ModalRoute.of(context)!.settings.arguments as Map;

  late final List<MatchItem> _matches = matchScreen['match'];
  late final String imagePath = matchScreen['image'];
  // ====Data From previous screen====
  // ===Data To Next screen====
  // ===Data To Next screen====

  final TextEditingController team1Controller = TextEditingController();
  final TextEditingController team2Controller = TextEditingController();
  final TextEditingController hourController = TextEditingController();
  final TextEditingController minutesController = TextEditingController();
  final TextEditingController apController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  String? selectedteam1;
  String? selectedteam2;
  String? selectedhour;
  String? selectedmin;
  String? selectedap;
  DateTime? selectedDate;

  static const double kRowVPad = 10.0;
  static const double kRowHPad = 10.0;
  static const double kCapsuleRadius = 60.0;

  @override
  void dispose() {
    team1Controller.dispose();
    team2Controller.dispose();
    hourController.dispose();
    minutesController.dispose();
    apController.dispose();
    dateController.dispose();
    super.dispose();
  }

  Map<String, List<MatchItem>> _groupByDate(List<MatchItem> items) {
    final map = <String, List<MatchItem>>{};
    for (final m in items) {
      final key = _dateKey(m.date);
      map.putIfAbsent(key, () => []).add(m);
    }
    for (final entry in map.entries) {
      entry.value.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    }
    return map;
  }

  String _dateKey(DateTime d) =>
      "${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}";

  String _dateLabel(DateTime d) {
    const weekdays = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    final weekday = weekdays[d.weekday - 1];
    final month = months[d.month - 1];
    return "$weekday, $month ${d.day}";
  }

  void _addMatch({
    required String team1,
    required String team2,
    required DateTime date,
    required int hour12,
    required int minute,
    required bool isPm,
  }) {
    setState(() {
      _matches.add(
        MatchItem(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          team1: team1,
          team2: team2,
          date: date,
          hour12: hour12,
          minute: minute,
          isPm: isPm,
        ),
      );
    });
  }

  void _deleteMatch(String id) {
    setState(() => _matches.removeWhere((m) => m.id == id));
  }

  @override
  Widget build(BuildContext context) {
    final grouped = _groupByDate(_matches);
    final sortedDateKeys = grouped.keys.toList()
      ..sort((a, b) => _parseKey(a).compareTo(_parseKey(b)));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context, _matches);
          },
        ),
        title: Text(
          "Matches",
          style: GoogleFonts.saira(
            // 👈 your Google Font
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Image.asset(imagePath, width: 50, height: 45),
          ),
        ],
        backgroundColor: const Color.fromRGBO(8, 45, 115, 1),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(8, 45, 115, 1),
              Color.fromRGBO(34, 87, 170, 1),
              Color.fromRGBO(176, 209, 235, 1),
            ],
          ),
        ),
        child: ListView(
          children: [
            const SizedBox(height: 30),
            ...sortedDateKeys.map((key) {
              final date = _parseKey(key);
              final dayMatches = grouped[key]!;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //* Date
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    // Date Header ("Monday, Jan 1")
                    child: Text(
                      _dateLabel(date),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ...dayMatches.map(
                    (m) => Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: kRowVPad,
                        horizontal: kRowHPad,
                      ),
                      child: Dismissible(
                        key: Key(m.id),
                        direction: DismissDirection.endToStart,
                        onDismissed: (_) => _deleteMatch(m.id),
                        background: Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 6,
                            horizontal: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(kCapsuleRadius),
                          ),
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20),
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(kCapsuleRadius),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                blurRadius: 6,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: () async {
                              debugPrint("Pressed ${m.label}");
                              Navigator.pushNamed(
                                context,
                                '/third',
                                arguments: {
                                  'point': m.points,
                                  "t1": m.team1,
                                  "t2": m.team2,
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              shadowColor: Colors.transparent,
                              minimumSize: const Size.fromHeight(90),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  kCapsuleRadius,
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    m.team1.toUpperCase(),
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.saira(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    m.timeLabel,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.roboto(
                                      color: const Color.fromARGB(
                                        255,
                                        113,
                                        113,
                                        113,
                                      ),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    m.team2.toUpperCase(),
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.saira(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
            const SizedBox(height: 100),
          ],
        ),
      ),
      //* Add new match button
      floatingActionButton: FloatingActionButton(
        onPressed: () => _newMatchPopup(context),
        backgroundColor: const Color.fromRGBO(8, 45, 115, 1),
        foregroundColor: Colors.white,
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }

  DateTime _parseKey(String key) {
    final p = key.split('-');
    return DateTime(int.parse(p[0]), int.parse(p[1]), int.parse(p[2]));
  }

  // * Pop up screen for the new match
  Future<Object?> _newMatchPopup(BuildContext context) {
    selectedteam1 = null;
    selectedteam2 = null;
    selectedhour = null;
    selectedmin = null;
    selectedap = null;
    selectedDate = null;
    dateController.clear();
    hourController.clear();
    minutesController.clear();
    apController.clear();
    team1Controller.clear();
    team2Controller.clear();

    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
        final media = MediaQuery.of(ctx);
        return FractionallySizedBox(
          heightFactor: 0.65,
          child: Padding(
            padding: EdgeInsets.only(bottom: media.viewInsets.bottom),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 44,
                      height: 5,
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    const Text(
                      'Create New Match',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // DATE
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Date",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextField(
                      controller: dateController,
                      readOnly: true,
                      decoration: const InputDecoration(
                        hintText: 'Select a date',
                        prefixIcon: Icon(Icons.event),
                        border: OutlineInputBorder(),
                      ),
                      onTap: () async {
                        final now = DateTime.now();
                        final picked = await showDatePicker(
                          context: ctx,
                          initialDate: now,
                          firstDate: DateTime(now.year - 1),
                          lastDate: DateTime(now.year + 2),
                        );
                        if (picked != null) {
                          setState(() {
                            selectedDate = picked;
                            dateController.text =
                                "${picked.month}/${picked.day}/${picked.year}";
                          });
                        }
                      },
                    ),

                    const SizedBox(height: 16),

                    // TIME
                    Row(
                      children: [
                        Expanded(
                          child: DropdownMenu<String>(
                            hintText: 'HH',
                            controller: hourController,
                            menuHeight: 300,
                            dropdownMenuEntries:
                                List.generate(12, (i) => (i + 1))
                                    .map(
                                      (h) => DropdownMenuEntry<String>(
                                        value: h.toString().padLeft(2, '0'),
                                        label: h.toString().padLeft(2, '0'),
                                      ),
                                    )
                                    .toList(),
                            onSelected: (item) =>
                                setState(() => selectedhour = item),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: DropdownMenu<String>(
                            hintText: 'MM',
                            menuHeight: 300,
                            controller: minutesController,
                            dropdownMenuEntries: List.generate(60, (i) => i)
                                .map(
                                  (m) => DropdownMenuEntry<String>(
                                    value: m.toString().padLeft(2, '0'),
                                    label: m.toString().padLeft(2, '0'),
                                  ),
                                )
                                .toList(),
                            onSelected: (item) =>
                                setState(() => selectedmin = item),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: DropdownMenu<String>(
                            hintText: 'am/pm',
                            controller: apController,
                            dropdownMenuEntries: MatchSelect.ap
                                .map(
                                  (t) => DropdownMenuEntry<String>(
                                    value: t,
                                    label: t,
                                  ),
                                )
                                .toList(),
                            onSelected: (item) =>
                                setState(() => selectedap = item),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // TEAMS
                    Row(
                      children: [
                        Expanded(
                          child: DropdownMenu<String>(
                            hintText: 'home team',
                            controller: team1Controller,
                            menuHeight: 200,
                            dropdownMenuEntries: MatchSelect.teams
                                .map(
                                  (team) => DropdownMenuEntry<String>(
                                    value: team,
                                    label: team,
                                  ),
                                )
                                .toList(),
                            onSelected: (val) =>
                                setState(() => selectedteam1 = val),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text("vs"),
                        const SizedBox(width: 8),
                        Expanded(
                          child: DropdownMenu<String>(
                            hintText: 'away team',
                            menuHeight: 200,
                            controller: team2Controller,
                            dropdownMenuEntries: MatchSelect.teams
                                .map(
                                  (team) => DropdownMenuEntry<String>(
                                    value: team,
                                    label: team,
                                  ),
                                )
                                .toList(),
                            onSelected: (val) =>
                                setState(() => selectedteam2 = val),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // ACTIONS
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => Navigator.pop(ctx),
                            child: const Text("Cancel"),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              if (selectedDate == null ||
                                  selectedteam1 == null ||
                                  selectedteam2 == null ||
                                  selectedhour == null ||
                                  selectedmin == null ||
                                  selectedap == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Please complete all fields.",
                                    ),
                                  ),
                                );
                                return;
                              }
                              _addMatch(
                                team1: selectedteam1!,
                                team2: selectedteam2!,
                                date: selectedDate!,
                                hour12: int.parse(selectedhour!),
                                minute: int.parse(selectedmin!),
                                isPm: selectedap == 'pm',
                              );
                              Navigator.pop(ctx);
                            },
                            child: const Text("Add Match"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
