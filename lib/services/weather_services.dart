import 'package:dio/dio.dart';
import 'package:new_weather_app/models/weather_model.dart';

class WeatherServices {
  const WeatherServices(this.dio);

  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  
  Future<WeatherModel> getWeatherData({required String cityName}) async {
    Response response = await dio.get('$baseUrl/forecast.json?key=0a9744d80d9d4ef0b49182803231408&q=$cityName&days=1');
    WeatherModel weatherModel = WeatherModel.fromJson(response.data);
    return weatherModel; 
  }
}