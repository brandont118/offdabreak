import 'package:flutter/material.dart';

//event buttons
class HomeButtonSpec {
  final String label;
  final String route;
  final IconData? icon; // optional built-in icon
  final String? asset; // optional image asset (png/svg)

  const HomeButtonSpec({
    required this.label,
    required this.route,
    this.icon,
    this.asset,
  });
}

//button format perm style
class HomeButton extends StatelessWidget {
  final HomeButtonSpec spec;

  const HomeButton({super.key, required this.spec});

  @override
  Widget build(BuildContext context) {
    return Center(
      //box shadow for buttons
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(500),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),

        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, spec.route);
          },
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(400, 90),

            // color black for dark theme
            // backgroundColor: const Color.fromRGBO(59,59,59, 1),
          ),

          child: Stack(
            alignment: Alignment.center, // centers the text
            children: [
              // Left-side icon or asset
              if (spec.icon != null)
                Positioned(
                  left: 5, // padding from left
                  child: Icon(spec.icon, size: 40),
                )
              else if (spec.asset != null)
                Positioned(
                  left: 1,
                  child: Image.asset(spec.asset!, height: 40),
                ),

              // Centered text
              Center(
                child: Text(
                  spec.label,
                  style: const TextStyle(
                    fontSize: 17,
                    // fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//button spacing column
class HomeButtonsColumn extends StatelessWidget {
  final List<HomeButtonSpec> items;
  final double gap;

  const HomeButtonsColumn({super.key, required this.items, this.gap = 20});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < items.length; i++) ...[
          HomeButton(spec: items[i]),
          if (i != items.length - 1) SizedBox(height: gap),
        ],
      ],
    );
  }
}
