# Flutter Heat Map Shamsi Calendar
A Heat Map Calendar based on heatmap_calendar but it also uses shamsi calender instead with some extra options like its bidirectional not just from past to today and also months are localized.

<img src="https://raw.githubusercontent.com/omidh28/flutter_heatmap_calendar_shamsi/master/screenshots/screenshot-01.png" height="500">


## Installing

### 1. Depend on it
Add this to your package's pubspec.yaml file:

Also shamsi_date package is required

```
dependencies:
  heatmap_calendar_shamsi: ^1.0.12+4
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
  // use Jalali.fromDateTime if using usual gregorian calender
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
    calenderType: HeatMapCalenderType.GREGORIAN,
    context: context,
  )
```
