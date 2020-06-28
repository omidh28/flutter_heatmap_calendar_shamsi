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

const gregorianWeekLables = [
  'Sa',
  'Su',
  'M',
  'Tu',
  'W',
  'Th',
  'F',
  'Sa',
  'Su',
  'M',
  'Tu',
  'W',
  'Th',
  'F',
];

class WeekLabels extends StatelessWidget {
  final double squareSize;
  final Color labelTextColor;
  final Locale locale;

  const WeekLabels({
    Key key,
    @required this.squareSize,
    @required this.labelTextColor,
    @required this.locale,
  })  : assert(squareSize != null),
        assert(squareSize > 0),
        assert(labelTextColor != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    int todayWeekDay = Jalali.now().weekDay;
    List weekLables =
        (locale.countryCode == 'IR' || locale.languageCode == 'fa')
            ? shamsiWeekLables
            : gregorianWeekLables;

    return Column(
      children: <Widget>[
        DefaultContainer(
          text: "",
          size: squareSize,
          textColor: labelTextColor,
          margin: 0,
        ),
        DefaultContainer(
          text: weekLables[todayWeekDay - 1],
          size: squareSize,
          textColor: labelTextColor,
        ),
        DefaultContainer(
          text: weekLables[todayWeekDay],
          size: squareSize,
          textColor: labelTextColor,
        ),
        DefaultContainer(
          text: weekLables[todayWeekDay + 1],
          size: squareSize,
          textColor: labelTextColor,
        ),
        DefaultContainer(
          text: weekLables[todayWeekDay + 2],
          size: squareSize,
          textColor: labelTextColor,
        ),
        DefaultContainer(
          text: weekLables[todayWeekDay + 3],
          size: squareSize,
          textColor: labelTextColor,
        ),
        DefaultContainer(
          text: weekLables[todayWeekDay + 4],
          size: squareSize,
          textColor: labelTextColor,
        ),
        DefaultContainer(
          text: weekLables[todayWeekDay + 5],
          size: squareSize,
          textColor: labelTextColor,
        ),
      ],
    );
  }
}
