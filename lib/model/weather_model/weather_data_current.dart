import 'dart:convert';
import 'package:weather/model/weather_model/weather.dart';
import 'daily.dart';
import 'hourly.dart';

class WeatherDataCurrent {
  final Current current;

  WeatherDataCurrent({
    required this.current,
  });

  factory WeatherDataCurrent.fromJson(Map<String, dynamic> json) =>
      WeatherDataCurrent(
        current: Current.fromMap(json['current']),
      );
}

class Current {
  int? temp;
  double? uvi;
  double? feelsLike;
  int? humidity;
  int? clouds;
  double? windSpeed;
  List<Weather>? weather;
  Current({
    this.temp,
    this.uvi,
    this.feelsLike,
    this.humidity,
    this.clouds,
    this.windSpeed,
    this.weather,
  });

  factory Current.fromMap(Map<String, dynamic> data) => Current(
        temp: (data['temp'] as num?)?.round(),
        humidity: data['humidity'] as int?,
        uvi: (data['uvi'] as num?)!.toDouble(),
        feelsLike: (data['feels_like'] as num?)?.toDouble(),
        clouds: data['clouds'] as int?,
        windSpeed: (data['wind_speed'] as num?)?.toDouble(),
        weather: (data['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'temp': temp,
        'humidity': humidity,
        'uvi': uvi,
        'feels_like': feelsLike,
        'clouds': clouds,
        'wind_speed': windSpeed,
        'weather': weather?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Current].
  factory Current.fromJson(String data) {
    return Current.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Current] to a JSON string.
  String toJson() => json.encode(toMap());
}

class WeatherModel {
  double? lat;
  double? lon;
  String? timezone;
  int? timezoneOffset;
  Current? current;
  List<Hourly>? hourly;
  List<Daily>? daily;

  WeatherModel({
    this.lat,
    this.lon,
    this.timezone,
    this.timezoneOffset,
    this.current,
    this.hourly,
    this.daily,
  });

  factory WeatherModel.fromMap(Map<String, dynamic> data) => WeatherModel(
        lat: (data['lat'] as num?)?.toDouble(),
        lon: (data['lon'] as num?)?.toDouble(),
        timezone: data['timezone'] as String?,
        timezoneOffset: data['timezone_offset'] as int?,
        current: data['current'] == null
            ? null
            : Current.fromMap(data['current'] as Map<String, dynamic>),
        hourly: (data['hourly'] as List<dynamic>?)
            ?.map((e) => Hourly.fromMap(e as Map<String, dynamic>))
            .toList(),
        daily: (data['daily'] as List<dynamic>?)
            ?.map((e) => Daily.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'lat': lat,
        'lon': lon,
        'timezone': timezone,
        'timezone_offset': timezoneOffset,
        'current': current?.toMap(),
        'hourly': hourly?.map((e) => e.toMap()).toList(),
        'daily': daily?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [WeatherModel].
  factory WeatherModel.fromJson(String data) {
    return WeatherModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [WeatherModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
