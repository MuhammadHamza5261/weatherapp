import 'package:weathercheckapp/model/weather_model.dart';

abstract class WeatherState{}

class InitialState extends WeatherState{}


class WeatherInProgressState extends WeatherState{}


class WeatherDataIsLoadedState extends WeatherState
{
  WeatherModel weatherModel;

  WeatherDataIsLoadedState({required this.weatherModel});
}


class WeatherErrorState extends WeatherState
{
   String error;
   WeatherErrorState(this.error);

}