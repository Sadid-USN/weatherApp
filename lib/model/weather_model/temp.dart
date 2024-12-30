import 'dart:convert';

class Temp {
final double? day;
final int? min;
final int? max;
final double? night;
final double? eve;
final double? morn;

  Temp({this.day, this.min, this.max, this.night, this.eve, this.morn});

  factory Temp.fromMap(Map<String, dynamic> data) => Temp(
        day: (data['day'] as num?)?.toDouble(),
        min: (data['min'] as num?)?.round(),
        max: (data['max'] as num?)?.round(),
        night: (data['night'] as num?)?.toDouble(),
        eve: (data['eve'] as num?)?.toDouble(),
        morn: (data['morn'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        'day': day,
        'min': min,
        'max': max,
        'night': night,
        'eve': eve,
        'morn': morn,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Temp].
  factory Temp.fromJson(String data) {
    return Temp.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Temp] to a JSON string.
  String toJson() => json.encode(toMap());
}
