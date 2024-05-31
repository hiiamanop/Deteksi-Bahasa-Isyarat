import 'package:flutter/material.dart';
import 'package:sign_language/views/detection.dart';
import 'package:sign_language/views/splash.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : DetectionPage()
    );
  }
}