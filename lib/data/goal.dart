// lib/data/nutrition_goals.dart

import 'user.dart';

class NutritionGoals {
  // Estimated macronutrient ratios based on typical goals
  static const _maintainRatios = {'protein': 0.15, 'carbs': 0.55, 'fat': 0.30};
  static const _reduceRatios = {'protein': 0.25, 'carbs': 0.40, 'fat': 0.35};
  static const _gainMuscleRatios = {'protein': 0.30, 'carbs': 0.50, 'fat': 0.20};

  /// Calculate daily calorie goal based on user's BMR and goal
  static int dailyCalories() {
    final baseCalories = UserData.bmr;
    switch (UserData.goal) {
      case 'Reduce Weight':
        // Usually a 20% calorie deficit
        return (baseCalories * 0.8).round();
      case 'Gain Muscle':
        // Usually a 15% calorie surplus
        return (baseCalories * 1.15).round();
      case 'Maintain Weight':
      default:
        return baseCalories.round();
    }
  }

  /// Calculate daily grams of protein, carbs, and fat based on calories and goal
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
      case 'Maintain Weight':
      default:
        ratios = _maintainRatios;
        break;
    }

    // Calories per gram: protein=4, carbs=4, fat=9
    final proteinGrams = ((calories * ratios['protein']!) / 4).round();
    final carbsGrams = ((calories * ratios['carbs']!) / 4).round();
    final fatGrams = ((calories * ratios['fat']!) / 9).round();

    return {
      'protein': proteinGrams,
      'carbs': carbsGrams,
      'fat': fatGrams,
    };
  }

  /// Recommended weekly exercise time (minutes), varies by goal
  static Map<String, int> weeklyExerciseMinutes() {
    switch (UserData.goal) {
      case 'Reduce Weight':
        // More cardio + some strength
        return {
          'cardio': 180, // 3 hours per week
          'strength': 90, // 1.5 hours per week
        };
      case 'Gain Muscle':
        // More strength focus
        return {
          'cardio': 90,
          'strength': 180,
        };
      case 'Maintain Weight':
      default:
        // Balanced moderate exercise
        return {
          'cardio': 120,
          'strength': 120,
        };
    }
  }
}
