import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Map<String, String> matches = {
  'Team A vs Team B': "10:00 am",
  'Team C vs Team D': "11:00 am",
  'Team E vs Team F': "10:20 am",
  'Team G vs Team H': "10:50 am",
};

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
    "ASG Aftermath",
  ];

  static List<String> ap = ['am', 'pm'];

  @override
  State<MatchSelect> createState() => _MatchSelectState();
}

class _MatchSelectState extends State<MatchSelect> {
  final TextEditingController team1Controller = TextEditingController();
  final TextEditingController team2Controller = TextEditingController();
  final TextEditingController hourController = TextEditingController();
  final TextEditingController minutesController = TextEditingController();
  final TextEditingController apController = TextEditingController();

  String? selectedteam1;
  String? selectedteam2;
  String? selectedhour;
  String? selectedmin;
  String? selectedap;

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
              children: matches.entries.map((entry) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => print("Pressed ${entry.key}"),
                        child: Text(entry.key),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 176, 209, 235),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Text(entry.value),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          delete_match(entry.key, matches);
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
                Row(
                  children: [
                    Expanded(
                      child: DropdownMenu<String>(
                        initialSelection: '',
                        hintText: '00',
                        enableSearch: true,
                        controller: hourController,
                        requestFocusOnTap: true,
                        showTrailingIcon: false,
                        leadingIcon: Icon(Icons.access_alarm),
                        enabled: true,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(2),
                          FilteringTextInputFormatter.allow(RegExp(r'^(?:1[0-2]|[1-9])$')),
                        ],
                        menuStyle: MenuStyle(
                          maximumSize: WidgetStatePropertyAll(
                            Size.fromHeight(200),
                          ), // 👈 limit height
                        ),
                        dropdownMenuEntries: List.generate(
                          13,
                          (index) => DropdownMenuEntry<String>(
                            value: index.toString().padLeft(2, '0'),
                            label: index.toString().padLeft(2, '0'),
                          ),
                        ),
                        //
                        onSelected: (String? item) {
                          setState(() {
                            selectedhour = item;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: DropdownMenu<String>(
                        initialSelection: '',
                        hintText: '00',
                        enableSearch: true,
                        controller: minutesController,
                        requestFocusOnTap: true,
                        showTrailingIcon: false,
                        enabled: true,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(2),
                          FilteringTextInputFormatter.allow(RegExp(r'^(?:[0-5]?\d|59)$')),
                        ],
                        menuStyle: MenuStyle(
                          maximumSize: WidgetStatePropertyAll(
                            Size.fromHeight(200),
                          ), // 👈 limit height
                        ),
                        dropdownMenuEntries: List.generate(
                          60,
                          (index) => DropdownMenuEntry<String>(
                            value: index.toString().padLeft(2, '0'),
                            label: index.toString().padLeft(2, '0'),
                          ),
                        ),
                        //
                        onSelected: (String? item) {
                          setState(() {
                            selectedmin = item;
                          });
                          
                        },
                      ),
                    ),
                    Expanded(
                      child: DropdownMenu<String>(
                        initialSelection: '',
                        hintText: 'am/pm',
                        enableSearch: true,
                        controller: apController,
                        requestFocusOnTap: false,
                        showTrailingIcon: false,
                        enabled: true,
                        menuStyle: MenuStyle(
                          maximumSize: WidgetStatePropertyAll(
                            Size.fromHeight(200),
                          ), // 👈 limit height
                        ),
                        dropdownMenuEntries: MatchSelect.ap
                            .map(
                              (time) => DropdownMenuEntry<String>(
                                value: time,
                                label: time,
                              ),
                            )
                            .toList(),
                        //
                        onSelected: (String? item) {
                          setState(() {
                            selectedap = item;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
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
                      //Fix this so it takes in the time now.
                      add_team(selectedteam1, selectedteam2, selectedhour,selectedmin,selectedap,matches);
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

void add_team(selectedteam1, selectedteam2,hour,min,ap ,Map<String, String> items) {
  if (selectedteam1 != null && selectedteam2 != null) { //Fix this if statement
    String match = ("$selectedteam1 vs $selectedteam2");
    items[match] = hour + ":$min $ap";
  }
}

void delete_match(String item, Map<String, String> items) {
  items.remove(item);
}

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
