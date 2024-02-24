import 'package:flutter/material.dart';

class WeatherModel {
  final String cityName;
  final String date;
  final double avgTemperature;
  final double minTemperature;
  final double maxTemperature;
  final String image;
  final String condition;

  const WeatherModel({
    required this.cityName,
    required this.date,
    required this.avgTemperature,
    required this.minTemperature,
    required this.maxTemperature,
    required this.image,
    required this.condition,
  });

  factory WeatherModel.fromJson(map) {
    return WeatherModel(
      cityName: map['location']['name'],
      date: map['current']['last_updated'],
      avgTemperature: map['forecast']['forecastday'][0]['day']['avgtemp_c'],
      minTemperature: map['forecast']['forecastday'][0]['day']['mintemp_c'],
      maxTemperature: map['forecast']['forecastday'][0]['day']['maxtemp_c'],
      image: map['forecast']['forecastday'][0]['day']['condition']['icon'],
      condition: map['forecast']['forecastday'][0]['day']['condition']['text'],
    );
  }
}