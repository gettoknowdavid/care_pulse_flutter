import 'package:intl/intl.dart';

final class DateTimeUtils {
  const DateTimeUtils._();

  static Map<DateFormatKey, String> format(DateTime input) {
    // Corresponds to: dateTimeOptions (e.g., 'Nov 25, 2023, 8:30 AM')
    // The Dart pattern for 'month: short', 'day: numeric', 'year: numeric',
    // 'hour: numeric', 'minute: numeric', 'hour12: true' is 'MMM d, y, h:mm a'.
    final dateTimeFormatter = DateFormat('MMM d, y, h:mm a', 'en_US');

    // Corresponds to: dateDayOptions (e.g., 'Mon, 11/25/2023')
    // The Dart pattern for 'weekday: short', 'month: 2-digit', 'day: 2-digit',
    // 'year: numeric' is 'E, MM/dd/yyyy'.
    final dateDayFormatter = DateFormat('E, MM/dd/yyyy', 'en_US');

    // Corresponds to: dateOptions (e.g., 'Nov 25, 2023')
    // The Dart pattern for 'month: short', 'day: numeric', 'year: numeric'
    // is 'MMM d, y'.
    final dateFormatter = DateFormat('MMM d, y', 'en_US');

    // Corresponds to: timeOptions (e.g., '8:30 AM')
    // The Dart pattern for 'hour: numeric', 'minute: numeric', 'hour12: true'
    // is 'h:mm a'.
    final timeFormatter = DateFormat('h:mm a', 'en_US');

    return {
      DateFormatKey.dateTime: dateTimeFormatter.format(input),
      DateFormatKey.dateDay: dateDayFormatter.format(input),
      DateFormatKey.date: dateFormatter.format(input),
      DateFormatKey.time: timeFormatter.format(input),
    };
  }

  static Map<DateFormatKey, String> formatFromString(String input) {
    final dateTimeInput = DateTime.parse(input);
    return format(dateTimeInput);
  }
}

enum DateFormatKey { dateDay, date, time, dateTime }

extension DateTimeUtilsX on DateTime {
  String get fDateTime {
    final formatter = DateFormat('MMM d, y, h:mm a', 'en_US');
    return formatter.format(this);
  }

  String get fDateDay {
    final formatter = DateFormat('E, MM/dd/yyyy', 'en_US');
    return formatter.format(this);
  }

  String get fDate {
    final formatter = DateFormat('MMM d, y', 'en_US');
    return formatter.format(this);
  }

  String get fTime {
    final formatter = DateFormat('h:mm a', 'en_US');
    return formatter.format(this);
  }
}
