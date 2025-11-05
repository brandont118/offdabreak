import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  static const _primaryBlue = const Color.fromRGBO(8, 45, 115, 1); // button color
  static const _textColor = Colors.black;        // headline
  static const _subText   = Colors.black54;      // subtitle

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final maxWidth = width < 420 ? width : 420.0;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 8),

                  // Illustration (use an asset if you have one)
                  // Replace with: Image.asset('assets/images/welcome.png', height: 180)
                  Icon(Icons.emoji_emotions_outlined, size: 130, color: _primaryBlue.withOpacity(.9)),
                  const SizedBox(height: 24),

                  // Title
                  Text(
                    'Welcome to OffdaBreak',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      color: _textColor,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Subtitle
                  const Text(
                    'Simple. Fast. Efficient. \nThe smarter way to scout paintball games.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.5,
                      color: _subText,
                      height: 1.35,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 36),

                  // Sign in (filled blue)
                  SizedBox(
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pushNamed('/login'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _primaryBlue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 3,
                        textStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w700,
                        ),
                      ),
                      child: const Text('Sign in'),
                    ),
                  ),

                  const SizedBox(height: 14),

                  // Register (outlined blue OR filled—your call)
                  SizedBox(
                    height: 52,
                    child: OutlinedButton(
                      onPressed: () => Navigator.of(context).pushNamed('/signup'),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: _primaryBlue, width: 1.6),
                        foregroundColor: _primaryBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w700,
                        ),
                      ),
                      child: const Text('Register'),
                    ),
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
