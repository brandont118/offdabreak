import 'package:flutter/material.dart';

List<String> matches = [
  'Team A vs Team B',
  'Team C vs Team D',
  'Team E vs Team F',
  'Team G vs Team H',
];

class MatchSelect extends StatefulWidget {
  const MatchSelect({super.key});

  static List<String> teams = [
    "Red Legion",
    "PaintballFIT",
    "Edmonton Impact",
    "San Diego Dynasty",
    "Los Angeles Ironmen",
    "Chicago AfterShock",
    "Seattle Uprising",
  ];

  @override
  State<MatchSelect> createState() => _MatchSelectState();
}

class _MatchSelectState extends State<MatchSelect> {
  final TextEditingController team1Controller = TextEditingController();
  final TextEditingController team2Controller = TextEditingController();

  String? selectedteam1;
  String? selectedteam2;

  @override
  // ignore: dead_code
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Match Route"),
        backgroundColor: Color.fromARGB(255, 0, 225, 255),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            // would let us scroll
            child: Column(
              children: matches.map((item) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => print("Pressed $item"),

                        child: Text(item),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          delete_match(item, matches);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                      ),
                      child: const Icon(Icons.delete),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              new_match_popup(context);
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(20),
            ),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  Future<Object?> new_match_popup(BuildContext context) {
    return showGeneralDialog(
      context: context,
      barrierColor: Colors.black,
      barrierDismissible: true,
      barrierLabel: 'Full Screen Dialog',
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder:
          (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Create New Match'),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: () {}, child: Text('Game Time')),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: DropdownMenu<String>(
                          initialSelection: 'team1',
                          hintText: 'home team',
                          controller: team1Controller,
                          requestFocusOnTap: true,
                          enableFilter: true,
                          dropdownMenuEntries: MatchSelect.teams
                              .map(
                                (team) => DropdownMenuEntry<String>(
                                  value: team,
                                  label: team,
                                ),
                              )
                              .toList(),
                          onSelected: (String? item) {
                            setState(() {
                              selectedteam1 = item;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text("vs", textAlign: TextAlign.center),
                      ),
                      Expanded(
                        flex: 3,
                        child: DropdownMenu<String>(
                          initialSelection: 'team2',
                          hintText: 'away team',
                          enableSearch: true,
                          enableFilter: true,
                          controller: team2Controller,
                          requestFocusOnTap: true,
                          dropdownMenuEntries: MatchSelect.teams
                              .map(
                                (team2) => DropdownMenuEntry<String>(
                                  value: team2,
                                  label: team2,
                                ),
                              )
                              .toList(),
                          onSelected: (String? item) {
                            setState(() {
                              selectedteam2 = item;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        add_team(selectedteam1, selectedteam2, matches);
                      }); // Refresh the match list
                      Navigator.pop(context);
                    },
                    child: Text("Add Match"),
                  ),
                ],
              ),
            );
          },
    );
  }
}

void add_team(selectedteam1, selectedteam2, List<String> items) {
  String match = ("$selectedteam1 vs $selectedteam2");
  items.add(match);
}

void delete_match(item, List<String> items) {
  items.remove(item);
}

//  Row(
//                   children: [
//                     Expanded(flex: 4, child: TeamInput(teamName: "Team A")),
//                     Expanded(
//                       flex: 1,
//                       child: Text("vs", textAlign: TextAlign.center),
//                     ),
//                     Expanded(flex: 4, child: TeamInput(teamName: "Team B")),
//                   ],
//                 ),

class TeamInput extends StatefulWidget {
  const TeamInput({super.key, required this.teamName});
  final String teamName;

  @override
  State<TeamInput> createState() => _TeamInputState();
}

class _TeamInputState extends State<TeamInput> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      // padding: EdgeInsets.all(5),
      // decoration: BoxDecoration(
      //   color: const Color.fromARGB(255, 242, 239, 239),
      //   borderRadius: BorderRadius.circular(10)
      //   ),
      child: TextField(
        controller: myController,
        decoration: InputDecoration(
          hintText: widget.teamName,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
