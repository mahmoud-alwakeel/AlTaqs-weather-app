import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:new_weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:new_weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weather});
final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weatherModel.cityName,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            'Updated at: ${formatDate(weatherModel.date)}',
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                weatherModel.image.contains("https:") ? 
                weatherModel.image :
                "https:${weatherModel.image}"
                ),
              Text(
                weatherModel.avgTemperature.toString(),
                style: const TextStyle(fontSize: 30),
              ),
              Column(
                children: [
                  Text('Max temp: ${weatherModel.maxTemperature.round()}'),
                  Text('Min temp: ${weatherModel.minTemperature.round()}'),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            weatherModel.condition,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
String formatDate(String dateString) {
  DateTime dateTime = DateTime.parse(dateString);
  return DateFormat.Hm().format(dateTime); // Formats hours and minutes
}