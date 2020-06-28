import 'package:flutter/material.dart';
import 'package:heatmap_calendar_shamsi/default_container.dart';
import 'package:shamsi_date/shamsi_date.dart';

const shamsiWeekLables = [
  'ش',
  'ی',
  'د',
  'س',
  'چ',
  'پ',
  'چ',
  'ش',
  'ی',
  'د',
  'س',
  'چ',
  'پ',
  'چ',
];

class WeekLabels extends StatelessWidget {
  final double squareSize;
  final Color labelTextColor;

  const WeekLabels(
      {Key key, @required this.squareSize, @required this.labelTextColor})
      : assert(squareSize != null),
        assert(squareSize > 0),
        assert(labelTextColor != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    int todayWeekDay = Jalali.now().weekDay;
    return Column(
      children: <Widget>[
        DefaultContainer(
          text: "",
          size: squareSize,
          textColor: labelTextColor,
          margin: 0,
        ),
        DefaultContainer(
          text: shamsiWeekLables[todayWeekDay - 1],
          size: squareSize,
          textColor: labelTextColor,
        ),
        DefaultContainer(
          text: shamsiWeekLables[todayWeekDay],
          size: squareSize,
          textColor: labelTextColor,
        ),
        DefaultContainer(
          text: shamsiWeekLables[todayWeekDay + 1],
          size: squareSize,
          textColor: labelTextColor,
        ),
        DefaultContainer(
          text: shamsiWeekLables[todayWeekDay + 2],
          size: squareSize,
          textColor: labelTextColor,
        ),
        DefaultContainer(
          text: shamsiWeekLables[todayWeekDay + 3],
          size: squareSize,
          textColor: labelTextColor,
        ),
        DefaultContainer(
          text: shamsiWeekLables[todayWeekDay + 4],
          size: squareSize,
          textColor: labelTextColor,
        ),
        DefaultContainer(
          text: shamsiWeekLables[todayWeekDay + 5],
          size: squareSize,
          textColor: labelTextColor,
        ),
      ],
    );
  }
}
