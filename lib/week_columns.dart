import 'package:flutter/material.dart';
import 'package:heatmap_calendar_shamsi/heatmap_calendar_shamsi.dart';
import 'package:heatmap_calendar_shamsi/heatmap_day.dart';
import 'package:heatmap_calendar_shamsi/month_label.dart';
import 'package:heatmap_calendar_shamsi/time_utils.dart';
import 'package:shamsi_date/shamsi_date.dart';

class WeekColumns extends StatelessWidget {
  final double squareSize;

  final Color labelTextColor;

  final Map<Jalali, int> inputValues;

  final Map<int, Color> colorThresholds;

  final double currentOpacity;

  final Color dayTextColor;

  final int columnsToCreate;

  final Jalali date;

  final HeatMapCalenderDirection direction;

  final HeatMapCalenderType calenderType;

  final MaterialLocalizations materialLocalizations;

  const WeekColumns({
    Key key,
    @required this.squareSize,
    @required this.labelTextColor,
    @required this.inputValues,
    @required this.colorThresholds,
    @required this.currentOpacity,
    @required this.dayTextColor,
    @required this.columnsToCreate,
    @required this.date,
    @required this.direction,
    @required this.calenderType,
    @required this.materialLocalizations,
  }) : super(key: key);

  /// The main logic for generating a list of columns representing a week
  /// Each column is a week having a [MonthLabel] and 7 [HeatMapDay] widgets
  List<Widget> buildWeekItems() {
    List<Jalali> dateListShamsi = getCalendarDates(columnsToCreate);
    List<DateTime> dateListGregorian =
        dateListShamsi.map((jalaliDate) => jalaliDate.toDateTime()).toList();

    List dateList = calenderType == HeatMapCalenderType.SHAMSI
        ? dateListShamsi
        : dateListGregorian;

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
          if (calenderType == HeatMapCalenderType.SHAMSI) {
            month = TimeUtils.shamsiMonthsLabels[dateList.first.month];
          } else {
            month = materialLocalizations
                .formatMonthYear(dateList.first)
                .split(' ')[0];
          }

          months.add(dateList.first.month);
        }

        columnItems.add(MonthLabel(
          size: squareSize,
          textColor: labelTextColor,
          text: month,
        ));
      } else {
        final currentDate = dateList.first;
        dateList.removeAt(0);

        int value;

        if (calenderType == HeatMapCalenderType.SHAMSI) {
          value =
              (inputValues[currentDate] == null) ? 0 : inputValues[currentDate];
        } else  {
          final Jalali jalaliCurrentDate = TimeUtils.removeTime(Jalali.fromDateTime(currentDate as DateTime));
          value =(inputValues[jalaliCurrentDate] == null) ? 0 : inputValues[jalaliCurrentDate];
        }

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
    Jalali endDayOfCalendar = TimeUtils.endDayOfCalendar(date, columnsAmount);

    Jalali startDayOfCalendar =
        TimeUtils.startDayOfCalendar(date, columnsAmount);

    if (direction == HeatMapCalenderDirection.NOW_TO_TOMORROW) {
      return TimeUtils.datesBetween(date, endDayOfCalendar.addDays(6));
    } else {
      return TimeUtils.datesBetween(startDayOfCalendar, date.addDays(6));
    }
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
