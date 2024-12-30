import 'package:intl/intl.dart';

class DateFormatters {
  // Возвращает только часы в 12-часовом формате
  static String getTime(final int timeStamp) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    return DateFormat('h').format(time); // Форматируем только час
  }

  // Возвращает только AM или PM
  static String getPeriod(final int timeStamp) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    return DateFormat('a').format(time); // Возвращаем только AM/PM
  }
}
