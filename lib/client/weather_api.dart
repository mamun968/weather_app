import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/modal/weather_model.dart';

class WeatherApiClient {
  Future<Weather>? getCurrentWeather(String? location) async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=8a598a2327e82d0e0d00a24d7a906f70");
    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    if (response.statusCode == 200) {
      
      return Weather.fromJson(body);
    }
    throw Exception("something error");
  }
}
