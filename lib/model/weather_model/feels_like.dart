import 'dart:convert';

class FeelsLike {
  double? day;
  double? night;
  double? eve;
  double? morn;

  FeelsLike({this.day, this.night, this.eve, this.morn});

  factory FeelsLike.fromMap(Map<String, dynamic> data) => FeelsLike(
        day: (data['day'] as num?)?.toDouble(),
        night: (data['night'] as num?)?.toDouble(),
        eve: (data['eve'] as num?)?.toDouble(),
        morn: (data['morn'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        'day': day,
        'night': night,
        'eve': eve,
        'morn': morn,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [FeelsLike].
  factory FeelsLike.fromJson(String data) {
    return FeelsLike.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [FeelsLike] to a JSON string.
  String toJson() => json.encode(toMap());
}
