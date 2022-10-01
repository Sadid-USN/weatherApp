import 'dart:convert';
import 'temp.dart';
import 'weather.dart';

class WeatherDailyData {
  List<Daily>? daily;

  WeatherDailyData({
    required this.daily,
  });
  factory WeatherDailyData.fromJson(Map<String, dynamic> json) =>
      WeatherDailyData(
        daily: List<Daily>.from(
          json['daily'].map(
            (e) => Daily.fromMap(e),
          ),
        ),
      );
}

class Daily {
  int? dt;
  Temp? temp;
  List<Weather>? weather;
  int? clouds;

  Daily({
    this.dt,
    this.temp,
    this.weather,
    this.clouds,
  });

  factory Daily.fromMap(Map<String, dynamic> data) => Daily(
        dt: data['dt'] as int?,
        temp: data['temp'] == null
            ? null
            : Temp.fromMap(data['temp'] as Map<String, dynamic>),
        weather: (data['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromMap(e as Map<String, dynamic>))
            .toList(),
        clouds: data['clouds'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'dt': dt,
        'weather': weather?.map((e) => e.toMap()).toList(),
        'clouds': clouds,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Daily].
  factory Daily.fromJson(String data) {
    return Daily.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Daily] to a JSON string.
  String toJson() => json.encode(toMap());
}
