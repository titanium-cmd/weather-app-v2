import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app_v2/models/weather_model.dart';

class WeatherController {
  Future<WeatherModel?>? getWeatherData() async {
    try {
      WeatherModel weatherModel;
      http.Response response = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=fbb6240979ac7fdf2bc3ff6dd942ae5c'));
      if (response.statusCode == 200) {
        // print('data::: ${response.body}');
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

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
