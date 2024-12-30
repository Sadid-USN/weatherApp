import 'dart:convert';

import 'weather.dart';

class WeatherHourlyData {
 final List<Hourly>? hourly;

  WeatherHourlyData({
    required this.hourly,
  });
  factory WeatherHourlyData.fromJson(Map<String, dynamic> json) =>
      WeatherHourlyData(
        hourly: List<Hourly>.from(
          json['hourly'].map(
            (e) => Hourly.fromMap(e),
          ),
        ),
      );
}

class Hourly {
 final int? dt;
 final int? temp;

 final List<Weather>? weather;

  Hourly({
    this.dt,
    this.temp,
    this.weather,
  });

  factory Hourly.fromMap(Map<String, dynamic> data) => Hourly(
        dt: data['dt'] as int?,
        temp: (data['temp'] as num?)?.round(),
        weather: (data['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'dt': dt,
        'temp': temp,
        'weather': weather?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Hourly].
  factory Hourly.fromJson(String data) {
    return Hourly.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Hourly] to a JSON string.
  String toJson() => json.encode(toMap());
}
