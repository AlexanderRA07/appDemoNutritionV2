//meal_entry.dart

import 'package:hive/hive.dart';

part 'meal_entry.g.dart';

@HiveType(typeId: 1)
class MealEntry extends HiveObject {
  @HiveField(0)
  final String type; // e.g., "Breakfast", "Snack"

  @HiveField(1)
  final int calories;

  @HiveField(2)
  final int protein;

  @HiveField(3)
  final int carbs;

  @HiveField(4)
  final int fat;

  MealEntry({
    required this.type,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
  });
}
