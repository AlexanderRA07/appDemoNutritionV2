// day.dart
// lib/data/day.dart
import 'package:hive/hive.dart';

part 'day.g.dart';

@HiveType(typeId: 0)
class DayData extends HiveObject {
  @HiveField(0)
  final int year;

  @HiveField(1)
  final int month;

  @HiveField(2)
  final int day;

  @HiveField(3)
  final int caloriesIn;

  @HiveField(4)
  final int caloriesOut;

  @HiveField(5)
  final int protein;

  @HiveField(6)
  final int carbs;

  @HiveField(7)
  final int fat;

  late final DateTime _date;

  DayData({
    required this.year,
    required this.month,
    required this.day,
    this.caloriesIn = 0,
    this.caloriesOut = 0,
    this.protein = 0,
    this.carbs = 0,
    this.fat = 0,
  }) {
    _date = DateTime(year, month, day);
  }

  DateTime get date => _date;

  // Create a copy with updated values (useful for updating fields)
  DayData copyWith({
    int? caloriesIn,
    int? caloriesOut,
    int? protein,
    int? carbs,
    int? fat,
  }) {
    return DayData(
      year: year,
      month: month,
      day: day,
      caloriesIn: caloriesIn ?? this.caloriesIn,
      caloriesOut: caloriesOut ?? this.caloriesOut,
      protein: protein ?? this.protein,
      carbs: carbs ?? this.carbs,
      fat: fat ?? this.fat,
    );
  }
}
