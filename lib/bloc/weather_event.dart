abstract class WeatherEvent{}

class SetDataToWeatherEvent extends WeatherEvent
{
  String country;


  SetDataToWeatherEvent({
    required this.country,
});
}