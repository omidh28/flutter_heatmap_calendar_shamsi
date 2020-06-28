import 'package:flutter/material.dart';
import 'package:heatmap_calendar_shamsi/heatmap_calendar_shamsi.dart';
import 'package:heatmap_calendar_shamsi/time_utils.dart';
import 'package:shamsi_date/shamsi_date.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: HeatMapCalendar(
            input: {
          TimeUtils.removeTime(Jalali.now().addDays(-3)): 5,
          TimeUtils.removeTime(Jalali.now().addDays(-2)): 35,
          TimeUtils.removeTime(Jalali.now().addDays(-1)): 14,
          TimeUtils.removeTime(Jalali.now()): 5,
            },
            colorThresholds: {
              1: Colors.green[100],
              10: Colors.green[300],
              30: Colors.green[500]
            },
            squareSize: 20.0,
            textOpacity: 0.3,
            labelTextColor: Colors.blueGrey,
            dayTextColor: Colors.blue[500],
            direction: HeatMapCalenderDirection.NOW_TO_TOMORROW,
            calenderType: HeatMapCalenderType.SHAMSI,
            context: context,
          ),
        ),
      ),
    );
  }
}
