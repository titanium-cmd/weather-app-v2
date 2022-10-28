import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app_v2/models/weather_model.dart';

class WeatherController {
  Future<WeatherModel?>? getWeatherData() async {
    try {
      WeatherModel weatherModel;
      http.Response response = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=fbb6240979ac7fdf2bc3ff6dd942ae5c'));
      if (response.statusCode == 200) {
        print('data::: ${response.body}');
        weatherModel = WeatherModel.fromJson(jsonDecode(response.body));
        return weatherModel;
      } else {
        return null;
      }
    } catch (e) {
      print('onError:: $e');
      return null;
    }
  }
}
