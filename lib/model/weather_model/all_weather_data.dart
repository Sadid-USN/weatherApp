import 'package:weather/model/weather_model/daily.dart';
import 'package:weather/model/weather_model/hourly.dart';
import 'package:weather/model/weather_model/weather_data_current.dart';

class AllWeatherData {
  final WeatherDataCurrent? current;
  final WeatherHourlyData? hourly;
  final WeatherDailyData? daily;
  AllWeatherData([
    this.current,
    this.hourly,
    this.daily,
  ]);

  // finction to fetch these values

  WeatherDataCurrent getWeatherDataCurrent() => current!;
  WeatherHourlyData getHourlyData() => hourly!;
  WeatherDailyData getDailyData() => daily!;
}
