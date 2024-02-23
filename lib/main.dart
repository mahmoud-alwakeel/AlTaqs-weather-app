import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:new_weather_app/screens/home_Screen.dart';


void main() {
  runApp(const MyWeatherApp());
}

class MyWeatherApp extends StatelessWidget {
  const MyWeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
