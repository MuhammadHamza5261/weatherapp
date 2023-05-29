import '../model/weather_model.dart';
import '../service/weather_service.dart';

class WeatherRepository
{
  WeatherModel? weatherModel;
  WeatherService weatherService = WeatherService();


  Future<WeatherModel> setDataToWeatherWeather({required String country})
  async{
    weatherModel  = (await weatherService.setDataToWeatherService(country: country)) as WeatherModel?;
    return weatherModel!;

  }

}