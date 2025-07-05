// day_manager.dart
import 'package:hive/hive.dart';
import 'day.dart';

class DayManager {
  static final Box<DayData> _box = Hive.box<DayData>('days');

  static String _dateKey(DateTime date) => '${date.year}-${date.month}-${date.day}';

  static Future<DayData> getToday() async {
    final now = DateTime.now();
    final key = _dateKey(now);
    DayData? day = _box.get(key);

    if (day == null) {
      day = DayData(year: now.year, month: now.month, day: now.day);
      await _box.put(key, day);
    }

    return day;
  }

  static Future<List<DayData>> getWeek() async {
    final now = DateTime.now();
    final List<DayData> week = [];

    for (int i = 0; i < 7; i++) {
      final date = now.subtract(Duration(days: i));
      final key = _dateKey(date);
      DayData? day = _box.get(key);

      if (day == null) {
        day = DayData(year: date.year, month: date.month, day: date.day);
        await _box.put(key, day);
      }

      week.add(day);
    }

    return week;
  }
}
