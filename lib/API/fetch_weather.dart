import 'dart:convert';
import 'dart:ffi';

import 'package:weather/API/api_key.dart';
import 'package:weather/model/weather_model/all_weather_data.dart';

import 'package:http/http.dart' as http;
import 'package:weather/model/weather_model/daily.dart';
import 'package:weather/model/weather_model/hourly.dart';
import 'package:weather/model/weather_model/weather_data_current.dart';

class FetchWeatherAPI {
  AllWeatherData? getWeatherDataCurrent;

  // Processing the data from response -> to json

  Future<AllWeatherData> progressData(lat, lon) async {
    var response = await http.get(Uri.parse(apiUR(lat, lon)));
    var jsonString = jsonDecode(response.body);
    getWeatherDataCurrent = AllWeatherData(
      WeatherDataCurrent.fromJson(jsonString),
      WeatherHourlyData.fromJson(jsonString),
      WeatherDailyData.fromJson(jsonString),
    );

    return getWeatherDataCurrent!;
  }

  String apiUR(double lat, double lon) {
    String url;

    url =
        "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=$apiKey&units=metric&exclude=minutely&lang=en";
    return url;
  }
}
