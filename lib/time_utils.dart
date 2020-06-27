import 'package:shamsi_date/shamsi_date.dart';

class TimeUtils {
  /// The first element is an empty string,
  /// once Dart's DateTime counts months from 1 to 12
  static const List<String> defaultMonthsLabels = [
    "",
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];

  static const List<String> defaultWeekLabels = [
    'S',
    'M',
    'T',
    'W',
    'T',
    'F',
    'S'
  ];

  /// Obtains the first day of the current week,
  /// based on user's current day
  static Jalali firstDayOfTheWeek(Jalali today) {
    return today.addDays((today.weekDay % DateTime.daysPerWeek) * -1);
  }

  static Jalali firstDayOfCalendar(Jalali day, int columnsAmount) {
    return day.addDays((DateTime.daysPerWeek * (columnsAmount - 1)) * -1);
  }

  /// Sets a DateTime hours/minutes/seconds/microseconds/milliseconds to 0
  static DateTime removeTime(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day);
  }

  /// Creates a list of [DateTime], including all days between [startDate] and [finishDate]
  static List<Jalali> datesBetween(Jalali startDate, Jalali finishDate) {
    DateTime startDateTime = startDate.toDateTime();
    DateTime finishDateDateTime = finishDate.toDateTime();

    assert(startDateTime.isBefore(finishDateDateTime));

    List<Jalali> datesList = new List();
    Jalali aux = startDate;
    DateTime auxDateTime = aux.toDateTime();
    do {
      datesList.add(aux);
      aux = aux.addDays(1);
    } while (finishDateDateTime.millisecondsSinceEpoch >= auxDateTime.millisecondsSinceEpoch);

    return datesList;
  }
}
