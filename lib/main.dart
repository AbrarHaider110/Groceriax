import 'package:flutter/material.dart';
import 'package:my_app/Screens/Signin.dart';
import 'package:my_app/Screens/signUp_screen.dart';
import 'package:my_app/Screens/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SignupScreen());
  }
}
