import 'package:flutter/material.dart';
import 'package:heatmap_calendar_shamsi/heatmap_day.dart';
import 'package:heatmap_calendar_shamsi/month_label.dart';
import 'package:heatmap_calendar_shamsi/time_utils.dart';
import 'package:shamsi_date/shamsi_date.dart';

class WeekColumns extends StatelessWidget {
  final double squareSize;

  final Color labelTextColor;

  final Map<DateTime, int> input;

  final Map<int, Color> colorThresholds;

  final double currentOpacity;

  final List<String> monthLabels;

  final Color dayTextColor;

  final int columnsToCreate;

  final Jalali date;

  const WeekColumns(
      {Key key,
      @required this.squareSize,
      @required this.labelTextColor,
      @required this.input,
      @required this.colorThresholds,
      @required this.currentOpacity,
      @required this.monthLabels,
      @required this.dayTextColor,
      @required this.columnsToCreate,
      @required this.date})
      : super(key: key);

  /// The main logic for generating a list of columns representing a week
  /// Each column is a week having a [MonthLabel] and 7 [HeatMapDay] widgets
  List<Widget> buildWeekItems() {
    List<Jalali> dateList = getCalendarDates(columnsToCreate);
    int totalDays = dateList.length;
    var daysPerWeek = DateTime.daysPerWeek;
    int totalWeeks = (totalDays / daysPerWeek).ceil();
    int amount = totalDays + totalWeeks;

    // The list of columns that will be returned
    List<Widget> columns = new List();

    // The list of items that will be used to form a week
    List<Widget> columnItems = new List();
    List<int> months = new List();

    for (int i = 0; i < amount; i++) {
      // If true, it means that it should be a label,
      // if false, it should be a HeatMapDay
      if (i % 8 == 0) {
        String month = "";

        if (dateList.isNotEmpty && !months.contains(dateList.first.month)) {
          month = monthLabels[dateList.first.month];
          months.add(dateList.first.month);
        }

        columnItems.add(MonthLabel(
          size: squareSize,
          textColor: labelTextColor,
          text: month,
        ));
      } else {
        Jalali currentDate = dateList.first;
        dateList.removeAt(0);

        final int value = (input[currentDate] == null) ? 0 : input[currentDate];

        HeatMapDay heatMapDay = HeatMapDay(
          value: value,
          thresholds: colorThresholds,
          size: squareSize,
          currentDay: currentDate.day,
          opacity: currentOpacity,
          textColor: dayTextColor,
        );
        columnItems.add(heatMapDay);

        // If the columnsItems has a length of 8, it means it should be ended.
        if (columnItems.length == 8) {
          columns.add(Column(children: columnItems));
          columnItems = new List();
        }
      }
    }

    if (columnItems.isNotEmpty) {
      columns.add(Column(children: columnItems));
    }
    return columns;
  }

  /// Creates a list of all weeks based on given [columnsAmount]
  List<Jalali> getCalendarDates(int columnsAmount) {
    Jalali firstDayOfTheWeek = TimeUtils.firstDayOfTheWeek(date);
    Jalali firstDayOfCalendar = TimeUtils.firstDayOfCalendar(firstDayOfTheWeek, columnsAmount);
    return TimeUtils.datesBetween(firstDayOfCalendar, date);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: buildWeekItems(),
      ),
    );
  }
}
