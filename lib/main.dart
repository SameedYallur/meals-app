import 'dart:js';

import 'package:flutter/material.dart';

import 'package:frontend/screens/login_screen.dart';
import 'package:frontend/screens/otp_verification_screen.dart';
import 'package:frontend/screens/signup_screen.dart';
import 'package:frontend/router.dart' as router;
import 'package:frontend/utils/router_constants.dart';
import 'package:frontend/screens/otp_verification_screen.dart';


void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Named Routing',
    onGenerateRoute: router.Router.generateRoute,
    initialRoute: stepScreenRoute,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OtpScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}