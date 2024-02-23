import 'package:dio/dio.dart';
import 'package:new_weather_app/models/weather_model.dart';

class WeatherServices {
  const WeatherServices(this.dio);

  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';

  Future<WeatherModel> getWeatherData({required String cityName}) async {
    try {
      Response response = await dio.get(
          '$baseUrl/forecast.json?key=0a9744d80d9d4ef0b49182803231408&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'there is an error, please try again later';
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception('there was an error, please try again later');
    }
  }
}
