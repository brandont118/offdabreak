import 'package:flutter/material.dart';
import 'event_select.dart';
import 'match_select.dart';
import 'point_edit.dart';
import 'point_selectpg.dart';
import 'login_screens/login_page.dart';
import 'login_screens/welcome_page.dart';
import 'login_screens/signup_page.dart';
import 'login_screens/forgot_pw.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Named Routes',
      debugShowCheckedModeBanner: false,
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => WelcomePage(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        'forgotpw': (context) => ForgotPasswordPage(),
        '/': (context) => EventSelect(),
        '/second': (context) => MatchSelect(),
        '/third': (context) => PointSelect(),
        '/fourth': (context) => PointEdit(),
      },
    ),
  );
}
