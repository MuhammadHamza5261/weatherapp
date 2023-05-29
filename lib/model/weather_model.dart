class WeatherModel {
  double? windSpeed;
  int? windDegrees;
  int? temp;
  int? humidity;
  int? sunset;
  int? minTemp;
  int? cloudPct;
  int? feelsLike;
  int? sunrise;
  int? maxTemp;

  WeatherModel(
      {this.windSpeed,
        this.windDegrees,
        this.temp,
        this.humidity,
        this.sunset,
        this.minTemp,
        this.cloudPct,
        this.feelsLike,
        this.sunrise,
        this.maxTemp});

  WeatherModel.fromJson(Map<String, dynamic> json) {
    windSpeed = json['wind_speed'];
    windDegrees = json['wind_degrees'];
    temp = json['temp'];
    humidity = json['humidity'];
    sunset = json['sunset'];
    minTemp = json['min_temp'];
    cloudPct = json['cloud_pct'];
    feelsLike = json['feels_like'];
    sunrise = json['sunrise'];
    maxTemp = json['max_temp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wind_speed'] = this.windSpeed;
    data['wind_degrees'] = this.windDegrees;
    data['temp'] = this.temp;
    data['humidity'] = this.humidity;
    data['sunset'] = this.sunset;
    data['min_temp'] = this.minTemp;
    data['cloud_pct'] = this.cloudPct;
    data['feels_like'] = this.feelsLike;
    data['sunrise'] = this.sunrise;
    data['max_temp'] = this.maxTemp;
    return data;
  }
}
