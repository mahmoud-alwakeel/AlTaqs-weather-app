import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:new_weather_app/models/weather_model.dart';
import 'package:new_weather_app/services/weather_services.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
            child: TextField(
              onSubmitted: (value) async {
                // or we can simpify this
                BlocProvider.of<GetWeatherCubit>(context).getWeatherInfo(cityName: value);
                // to this 
                var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
                getWeatherCubit.getWeatherInfo(cityName: value);
                Navigator.pop(context);
              },
          decoration: InputDecoration(
            hintText: 'Search fo a city',
            labelText: 'search',
            labelStyle: const TextStyle(color: Colors.blue), // Added labelStyle

            suffixIcon: const Icon(Icons.search),
            contentPadding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(16),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        )),
      ),
    );
  }
}
