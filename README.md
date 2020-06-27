[![Build Status](https://travis-ci.org/pedrohff/flutter_heatmap_calendar.svg?branch=master)](https://travis-ci.org/pedrohff/flutter_heatmap_calendar)
# Flutter Heat Map Calendar
A Heat Map Calendar based on Github's contributions chart which can be used to visualize values over time

![HeatMap Calendar in action](https://thumbs.gfycat.com/ImmaculateRequiredLarva.webp)


## Installing

### 1. Depend on it
Add this to your package's pubspec.yaml file:

Also shamsi_date package is required

```
dependencies:
  heatmap_calendar_shamsi: ^1.2.5
  shamsi_date: ^0.8.1
```

### 2. Install it
You can install packages from the command line:

with pub:

```shell
$ pub get
```

with Flutter:

```shell
$ flutter pub get
```

## Example
```dart
import 'package:heatmap_calendar_shamsi/heatmap_calendar_shamsi.dart';
import 'package:heatmap_calendar_shamsi/time_utils.dart';
...

HeatMapCalendar(
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
  )
```
