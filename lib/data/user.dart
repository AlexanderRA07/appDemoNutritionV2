// user.dart

class UserData {
  static double feet = 0;
  static double inches = 0;
  static double weight = 0;
  static String sex = '--';
  static double bmi = 0;

  static String goal = 'Maintain Weight';
  static int? age = 0;
  static double bmr = 0;

  static String get goalString => goal;

  static String get heightString => '${feet.toInt()}ft ${inches.toInt()}in';
  static String get weightString => '${weight.toInt()} lbs';
  static String get sexString => sex;
  static String get bmiString => bmi > 0 ? bmi.toStringAsFixed(1) : '--';

  static String get ageString => (age != null && age! > 0 && age! <= 150) ? '$age' : '--';
  static String get bmrString => bmr > 0 ? '${bmr.toStringAsFixed(0)} cal/day' : '--';
}

