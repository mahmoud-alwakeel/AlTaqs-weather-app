import 'package:flutter/material.dart';
import 'package:new_weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weatherModel});

  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weatherModel.cityName,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            'Updated at: 10:00',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/rainy.png'),
              Text(
                '15',
                style: TextStyle(fontSize: 30),
              ),
              Column(
                children: [
                  Text('Max temp: 20'),
                  Text('Min temp: 12'),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Light Rain',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
