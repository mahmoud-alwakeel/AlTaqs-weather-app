import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_weather_app/cubit/get_weather_cubit/get_weather_states.dart';
import 'package:new_weather_app/models/weather_model.dart';
import 'package:new_weather_app/services/weather_services.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());

  getWeatherInfo({required String cityName}) async {
    try {
  WeatherModel weatherModel =
      await WeatherServices(Dio()).getWeatherData(cityName: cityName);
  log(weatherModel.cityName);
  emit(WeatherLoadedState(weatherModel: weatherModel)); 
} catch (e) {
  emit(WeatherFailureState(
    errorMessage: e.toString()
  ));
}
  }
}
