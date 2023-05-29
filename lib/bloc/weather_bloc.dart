import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathercheckapp/bloc/weather_event.dart';
import 'package:weathercheckapp/bloc/weather_state.dart';


import '../model/weather_model.dart';
import '../repository/weather_repository.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState>
{
  WeatherModel? weatherModel;
  WeatherRepository weatherRepository = WeatherRepository();



  WeatherBloc() : super(InitialState()) {
    on<WeatherEvent>((event, emit)
    async {
      if (event is SetDataToWeatherEvent) {
        emit(WeatherInProgressState());

        try {
          weatherModel = await weatherRepository.setDataToWeatherWeather(
            country: event.country,
          );
          emit(WeatherDataIsLoadedState(weatherModel: weatherModel!));
        }
        catch (e)
        {
          emit(WeatherErrorState(e.toString()));
        }
      }
    });

  }
}