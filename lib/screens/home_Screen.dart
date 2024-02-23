import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:new_weather_app/cubit/get_weather_cubit/get_weather_states.dart';
import 'package:new_weather_app/screens/search_screen.dart';
import 'package:new_weather_app/widgets/no_weather_widget.dart';
import 'package:new_weather_app/widgets/weather_info_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Al Taqs'),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return SearchScreen();
            }));
          }, icon: Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return NoWeatherBody();
          } else if(state is WeatherLoadedState) {
            return WeatherInfoBody(weatherModel: state.weatherModel,);
          } else {
            return Text('OPPS there was an error');
          }
        },
      ),
    );
  }
}