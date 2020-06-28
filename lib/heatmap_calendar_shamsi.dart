import 'package:flutter/material.dart';
import 'package:heatmap_calendar_shamsi/heatmap_day.dart';
import 'package:heatmap_calendar_shamsi/time_utils.dart';
import 'package:heatmap_calendar_shamsi/week_columns.dart';
import 'package:heatmap_calendar_shamsi/week_labels.dart';
import 'package:shamsi_date/shamsi_date.dart';

enum HeatMapCalenderDirection { NOW_TO_TOMORROW, NOW_TO_YESTERDAY }

enum HeatMapCalenderType { SHAMSI, GREGORIAN }

class HeatMapCalendar extends StatefulWidget {
  static const double COLUMN_COUNT = 11;
  static const double ROW_COUNT = 8;
  static const double EDGE_SIZE = 4;

  /// The inputs that will fill the calendar with data
  final Map<Jalali, int> input;

  /// The thresholds which will map the given [input] to a color
  ///
  /// Make sure to map starting on number 1, so the user might notice the difference between
  /// a day that had no input and one that had
  /// Example: {1: Colors.green[100], 20: Colors.green[200], 40: Colors.green[300]}
  final Map<int, Color> colorThresholds;

  /// The size of each item of the calendar
  final double squareSize;

  /// The opacity of the text when the user double taps the widget
  final double textOpacity;

  /// The color of the texts in the weeks/months labels
  final Color labelTextColor;

  /// The color of the text that identifies the days
  final Color dayTextColor;

  /// Helps avoiding overspacing issues
  final double safetyMargin;

  /// direction of calender from now
  final HeatMapCalenderDirection direction;

  /// if its jalali or gregorian
  final HeatMapCalenderType calenderType;

  /// used to translate months and week days lables 
  final BuildContext context;

  const HeatMapCalendar({
    Key key,
    @required this.input,
    @required this.colorThresholds,
    @required this.context,
    this.squareSize: 16,
    this.textOpacity: 0.2,
    this.labelTextColor: Colors.black,
    this.dayTextColor: Colors.black,
    this.safetyMargin: 0,
    this.direction: HeatMapCalenderDirection.NOW_TO_YESTERDAY,
    this.calenderType: HeatMapCalenderType.SHAMSI,
  }) : super(key: key);

  @override
  HeatMapCalendarState createState() {
    return HeatMapCalendarState();
  }
}

class HeatMapCalendarState extends State<HeatMapCalendar> {
  double currentOpacity = 0;
  bool displayDates = false;

  /// Toggles the labels in all [HeatMapDay]s
  void onDoubleTap() {
    setState(() {
      displayDates = !displayDates;
      currentOpacity = displayDates ? widget.textOpacity : 0;
    });
  }

  /// Calculates the right amount of columns to create based on [maxWidth]
  ///
  /// returns the number of columns that the widget should have
  int getColumnsToCreate(double maxWidth) {
    assert(maxWidth > (2 * (HeatMapCalendar.EDGE_SIZE + widget.squareSize)));

    // The given size of a square + the size of the margin
    final double widgetWidth = widget.squareSize + HeatMapCalendar.EDGE_SIZE;
    return (maxWidth - widget.safetyMargin) ~/ widgetWidth;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return InkWell(
          onDoubleTap: onDoubleTap,
          child: Container(
            height: (widget.squareSize + HeatMapCalendar.EDGE_SIZE) *
                (HeatMapCalendar.ROW_COUNT + 1),
            width: constraints.maxWidth,
            child: Row(
              children: <Widget>[
                WeekLabels(
                  locale: Localizations.localeOf(widget.context),
                  squareSize: widget.squareSize,
                  labelTextColor: widget.labelTextColor,
                ),
                WeekColumns(
                  materialLocalizations: MaterialLocalizations.of(widget.context),
                  calenderType: widget.calenderType,
                  direction: widget.direction,
                  squareSize: widget.squareSize,
                  labelTextColor: widget.labelTextColor,
                  input: widget.input,
                  colorThresholds: widget.colorThresholds,
                  currentOpacity: currentOpacity,
                  dayTextColor: widget.dayTextColor,
                  columnsToCreate: getColumnsToCreate(constraints.maxWidth) - 1,
                  date: Jalali.now(),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
