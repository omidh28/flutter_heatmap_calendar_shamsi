import 'package:flutter/material.dart';
import 'package:heatmap_calendar_shamsi/default_container.dart';

const shamsiWeekLables = [
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
    return Column(
      children: <Widget>[
        DefaultContainer(
          text: "",
          size: squareSize,
          textColor: labelTextColor,
          margin: 0,
        ),
        DefaultContainer(
          text: shamsiWeekLables[0],
          size: squareSize,
          textColor: labelTextColor,
        ),
        DefaultContainer(
          text: shamsiWeekLables[1],
          size: squareSize,
          textColor: labelTextColor,
        ),
        DefaultContainer(
          text: shamsiWeekLables[2],
          size: squareSize,
          textColor: labelTextColor,
        ),
        DefaultContainer(
          text: shamsiWeekLables[3],
          size: squareSize,
          textColor: labelTextColor,
        ),
        DefaultContainer(
          text: shamsiWeekLables[4],
          size: squareSize,
          textColor: labelTextColor,
        ),
        DefaultContainer(
          text: shamsiWeekLables[5],
          size: squareSize,
          textColor: labelTextColor,
        ),
        DefaultContainer(
          text: shamsiWeekLables[6],
          size: squareSize,
          textColor: labelTextColor,
        ),
      ],
    );
  }
}
