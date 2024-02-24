import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:new_weather_app/cubit/get_weather_cubit/get_weather_states.dart';
import 'package:new_weather_app/screens/home_screen.dart';

void main() {
  runApp(const MyWeatherApp());
}

class MyWeatherApp extends StatelessWidget {
  const MyWeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.condition,
                ),
              ),
              home: const HomeScreen(),
            );
          },
        );
      }),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.purple;
  }
  switch (condition) {
    case 'Sunny':
      return Colors.orange;
    case 'Cloudy':
      return Colors.grey;
    default:
      return Colors.pink;
  }
}
