// lib/data/nutrition_goals.dart

import 'user.dart';

class NutritionGoals {
  static const _maintainRatios = {'protein': 0.15, 'carbs': 0.55, 'fat': 0.30};
  static const _reduceRatios = {'protein': 0.25, 'carbs': 0.40, 'fat': 0.35};
  static const _gainMuscleRatios = {'protein': 0.30, 'carbs': 0.50, 'fat': 0.20};

  static const int caloriesInTolerance = 200;
  static const int caloriesOutTolerance = 150;
  static const int proteinTolerance = 10;
  static const int carbsTolerance = 20;
  static const int fatTolerance = 8;

  static int dailyCalories() {
    final baseCalories = UserData.bmr;
    switch (UserData.goal) {
      case 'Reduce Weight':
        return (baseCalories * 0.8).round();
      case 'Gain Muscle':
        return (baseCalories * 1.15).round();
      default:
        return baseCalories.round();
    }
  }

  static Map<String, int> dailyMacros() {
    final calories = dailyCalories();
    Map<String, double> ratios;

    switch (UserData.goal) {
      case 'Reduce Weight':
        ratios = _reduceRatios;
        break;
      case 'Gain Muscle':
        ratios = _gainMuscleRatios;
        break;
      default:
        ratios = _maintainRatios;
        break;
    }

    return {
      'protein': ((calories * ratios['protein']!) / 4).round(),
      'carbs': ((calories * ratios['carbs']!) / 4).round(),
      'fat': ((calories * ratios['fat']!) / 9).round(),
    };
  }

  static Map<String, int> weeklyExerciseMinutes() {
    switch (UserData.goal) {
      case 'Reduce Weight':
        return {'cardio': 180, 'strength': 90};
      case 'Gain Muscle':
        return {'cardio': 90, 'strength': 180};
      default:
        return {'cardio': 120, 'strength': 120};
    }
  }

  static bool isBelowMinimum({
    required int value,
    required int goal,
    required int tolerance,
  }) {
    return value < (goal - tolerance);
  }

  static bool isAboveMaximum({
    required int value,
    required int goal,
    required int tolerance,
  }) {
    return value > (goal + tolerance);
  }

  static int _toleranceForMetric(String metric) {
    switch (metric.toLowerCase()) {
      case 'calories':
        return caloriesInTolerance;
      case 'protein':
        return proteinTolerance;
      case 'carbs':
        return carbsTolerance;
      case 'fat':
        return fatTolerance;
      default:
        return 5;
    }
  }

  static bool isBelow(String metric, int value, int goal) {
    final tolerance = _toleranceForMetric(metric);
    return isBelowMinimum(value: value, goal: goal, tolerance: tolerance);
  }

  static bool isAbove(String metric, int value, int goal) {
    final tolerance = _toleranceForMetric(metric);
    return isAboveMaximum(value: value, goal: goal, tolerance: tolerance);
  }

  static int restingCalories() {
    return (UserData.bmr / 7).round();
  }

  static String weeklyStatusIcon(int totalIn, int totalOut) {
    final goal = dailyCalories();
    final diff = totalIn - totalOut;

    if (diff.abs() <= caloriesInTolerance) return '✔️';
    if (diff > caloriesInTolerance) return '❌';
    return '⚠️';
  }
}
