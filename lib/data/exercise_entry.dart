//exercise_entry.dart

import 'package:hive/hive.dart';

part 'exercise_entry.g.dart';

@HiveType(typeId: 2)
class ExerciseEntry extends HiveObject {
  @HiveField(0)
  final String type; // e.g., "Cardio", "Strength"

  @HiveField(1)
  final int duration; // in minutes

  @HiveField(2)
  final String intensity; // e.g., "Low", "Medium", "High"

  @HiveField(3)
  final int caloriesBurned;

  ExerciseEntry({
    required this.type,
    required this.duration,
    required this.intensity,
    required this.caloriesBurned,
  });
}
