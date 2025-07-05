// day.dart

// lib/data/day.dart
import 'package:hive/hive.dart';
import 'meal_entry.dart';
import 'exercise_entry.dart';

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
  int caloriesIn;

  @HiveField(4)
  int caloriesOut;

  @HiveField(5)
  int protein;

  @HiveField(6)
  int carbs;

  @HiveField(7)
  int fat;

  @HiveField(8)
  List<MealEntry> meals;

  @HiveField(9)
  List<ExerciseEntry> exercises;

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
    List<MealEntry>? meals,
    List<ExerciseEntry>? exercises,
  })  : meals = meals ?? [],
        exercises = exercises ?? [] {
    _date = DateTime(year, month, day);
  }

  DateTime get date => _date;

  /// Add a meal and update totals
  void addMeal(MealEntry meal) {
    meals.add(meal);
    caloriesIn += meal.calories;
    protein += meal.protein;
    carbs += meal.carbs;
    fat += meal.fat;
    save(); // Persist the update
  }

  /// Add an exercise and update totals
  void addExercise(ExerciseEntry exercise) {
    exercises.add(exercise);
    caloriesOut += exercise.caloriesBurned;
    save(); // Persist the update
  }

  /// Create a copy of the day with updated values
  DayData copyWith({
    int? caloriesIn,
    int? caloriesOut,
    int? protein,
    int? carbs,
    int? fat,
    List<MealEntry>? meals,
    List<ExerciseEntry>? exercises,
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
      meals: meals ?? List.from(this.meals),
      exercises: exercises ?? List.from(this.exercises),
    );
  }
}
