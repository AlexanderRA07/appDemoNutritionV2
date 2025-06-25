Future<DayData> getOrCreateTodayDayData() async {
  final box = Hive.box<DayData>('days');
  final now = DateTime.now();
  final key = '${now.year}-${now.month}-${now.day}';

  DayData? today = box.get(key);
  if (today == null) {
    today = DayData(year: now.year, month: now.month, day: now.day);
    await box.put(key, today);
  }

  return today;
}

