import 'package:flutter/material.dart';
import 'package:new_weather_app/screens/home_Screen.dart';
import 'package:new_weather_app/screens/search_screen.dart';

void main() {
  runApp(const MyWeatherApp());
}

class MyWeatherApp extends StatelessWidget {
  const MyWeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SearchScreen(),
    );
  }
}
