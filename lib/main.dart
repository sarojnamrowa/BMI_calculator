import 'package:flutter/material.dart';
import 'package:simple_app/Weather/weather_screen.dart';

import 'BMI Calculator/bmi_screen.dart';

void main() {
  runApp(MyApp());
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
      debugShowCheckedModeBanner: false,
      home: WeatherScreen(),
    );
  }
}
