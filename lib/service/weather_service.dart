import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/weather_model.dart';


class WeatherService
{
  Future<WeatherModel> setDataToWeatherService({required String country})
  async {
    final response = await http.get(Uri.parse('https://api.api-ninjas.com/v1/weather?city=$country'),
      headers: <String,String>
      {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'X-Api-Key': 'VzTvToO5yUNdij3XTnDElbRiSsegQAJ8cTdXaILf',
      },

    );
    if(response.statusCode == 200)
    {
      final data = jsonDecode(response.body);
      WeatherModel weatherModel = WeatherModel.fromJson(data);
     return weatherModel;
    }

    else
    {
      throw Exception('${response.statusCode} : ${response.reasonPhrase}');
    }
  }
}