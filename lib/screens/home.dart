// home.dart

import 'package:flutter/material.dart';
import '../data/user.dart';
import '../data/goal.dart';
import '../data/day_manager.dart';
import '../data/day.dart';
import '../sidebar/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  List<DayData>? weekData;
  DayData? todayData;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _loadDayData();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _loadDayData();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadDayData();
  }

  Future<void> _loadDayData() async {
    final today = await DayManager.getToday();
    final week = await DayManager.getWeek();

    // Sort weekData by weekday with Sunday first
    week.sort((a, b) {
      int aWeekday = DateTime(a.year, a.month, a.day).weekday;
      int bWeekday = DateTime(b.year, b.month, b.day).weekday;
      int mapWeekday(int d) => d == DateTime.sunday ? 0 : d;
      return mapWeekday(aWeekday).compareTo(mapWeekday(bWeekday));
    });

    setState(() {
      todayData = today;
      weekData = week;
    });
  }

  Widget _buildDailyGoalsSection() {
    final dailyCalories = NutritionGoals.dailyCalories();
    final dailyMacros = NutritionGoals.dailyMacros();

    return Column(
      children: [
        const Center(
            child: Text("Daily Goals",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
        const SizedBox(height: 10),
        Table(
          border: TableBorder.all(),
          columnWidths: const {
            0: FlexColumnWidth(1.8),
            1: FlexColumnWidth(2),
            2: FlexColumnWidth(2),
            3: FlexColumnWidth(1.2),
          },
          children: [
            const TableRow(
              children: [
                Padding(
                    padding: EdgeInsets.all(8),
                    child: Text("Metric",
                        style: TextStyle(fontWeight: FontWeight.bold))),
                Padding(
                    padding: EdgeInsets.all(8),
                    child: Text("Today",
                        style: TextStyle(fontWeight: FontWeight.bold))),
                Padding(
                    padding: EdgeInsets.all(8),
                    child: Text("Goal",
                        style: TextStyle(fontWeight: FontWeight.bold))),
                Padding(
                    padding: EdgeInsets.all(8),
                    child: Text("Status",
                        style: TextStyle(fontWeight: FontWeight.bold))),
              ],
            ),
            ...['calories', 'protein', 'carbs', 'fat'].map((metric) {
              final todayVal = _getTodayValue(metric);
              final goalVal = _getGoalValue(metric, dailyCalories, dailyMacros);
              final statusIcon = _getStatusIcon(metric, todayVal, goalVal);
              return TableRow(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(metric.capitalize())),
                  Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                          metric == 'calories' ? "$todayVal" : "${todayVal}g")),
                  Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                          metric == 'calories' ? "$goalVal" : "${goalVal}g")),
                  Center(child: statusIcon),
                ],
              );
            }),
          ],
        ),
      ],
    );
  }

  int _getTodayValue(String metric) {
    switch (metric) {
      case 'calories':
        return todayData?.caloriesIn ?? 0;
      case 'protein':
        return todayData?.protein ?? 0;
      case 'carbs':
        return todayData?.carbs ?? 0;
      case 'fat':
        return todayData?.fat ?? 0;
      default:
        return 0;
    }
  }

  int _getGoalValue(String metric, int calories, Map<String, int> macros) {
    switch (metric) {
      case 'calories':
        return calories;
      case 'protein':
        return macros['protein'] ?? 0;
      case 'carbs':
        return macros['carbs'] ?? 0;
      case 'fat':
        return macros['fat'] ?? 0;
      default:
        return 0;
    }
  }

  Widget _getStatusIcon(String metric, int actual, int target) {
    if (NutritionGoals.isBelow(metric, actual, target)) {
      return const Icon(Icons.remove, color: Colors.orange);
    } else if (NutritionGoals.isAbove(metric, actual, target)) {
      return const Icon(Icons.clear, color: Colors.red);
    } else {
      return const Icon(Icons.check, color: Colors.green);
    }
  }

  Widget _buildWeeklySection() {
    final today = DateTime.now();

    return Column(
      children: [
        const Center(
            child: Text("Weekly Overview",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: weekData!.map((day) {
            final date = DateTime(day.year, day.month, day.day);
            final isToday =
                date.day == today.day && date.month == today.month && date.year == today.year;
            final label = _weekdayLabel(date);
            final totalOut = (day.caloriesOut + UserData.bmr).round();
            final totalIn = day.caloriesIn;
            final iconStr = NutritionGoals.weeklyStatusIcon(totalIn, totalOut);

            return Column(
              children: [
                Text(label,
                    style: TextStyle(
                        color: isToday ? Colors.green : Colors.black,
                        fontWeight: isToday ? FontWeight.bold : FontWeight.normal)),
                const SizedBox(height: 4),
                Column(
                  children: [
                    const Text("In", style: TextStyle(fontSize: 10)),
                    Text("$totalIn", style: const TextStyle(fontSize: 12)),
                    const Text("Out", style: TextStyle(fontSize: 10)),
                    Text("$totalOut", style: TextStyle(fontSize: 12)),
                  ],
                ),
                Text(iconStr, style: const TextStyle(fontSize: 20)),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildRecommendationSection() {
    final goal = UserData.goalString.toLowerCase();
    final targets = NutritionGoals.weeklyExerciseMinutes();
    final cardioGoal = targets['cardio']!;
    final strengthGoal = targets['strength']!;

    int cardioTotalWeek = 0, strengthTotalWeek = 0;
    List<String> cardioInts = [], strengthInts = [];

    // Calculate total cardio/strength minutes for the week
    for (final day in weekData!) {
      for (final ex in day.exercises) {
        if (ex.type.toLowerCase().contains('cardio')) {
          cardioTotalWeek += ex.duration;
          cardioInts.add(ex.intensity);
        } else {
          strengthTotalWeek += ex.duration;
          strengthInts.add(ex.intensity);
        }
      }
    }

    // Calculate today's cardio/strength minutes separately
    final today = DateTime.now();
    DayData? todayDataLocal;
    try {
      todayDataLocal = weekData!.firstWhere(
        (d) =>
            d.year == today.year &&
            d.month == today.month &&
            d.day == today.day,
      );
    } catch (e) {
      todayDataLocal = null;
    }

    int cardioToday = 0;
    int strengthToday = 0;

    if (todayDataLocal != null) {
      for (final ex in todayDataLocal.exercises) {
        if (ex.type.toLowerCase().contains('cardio')) {
          cardioToday += ex.duration;
        } else {
          strengthToday += ex.duration;
        }
      }
    }

    bool needCardio = cardioTotalWeek < cardioGoal;
    bool needStrength = !needCardio && (strengthTotalWeek < strengthGoal);

    String avgIntensity(List<String> ints) {
      if (ints.isEmpty) return 'Moderate';
      final map = {'Low': 0, 'Moderate': 1, 'High': 2};
      double avg = ints.map((i) => map[i] ?? 1).fold(0, (a, b) => a + b) / ints.length;
      if (avg > 1.5) return 'High';
      if (avg < 0.5) return 'Low';
      return 'Moderate';
    }

    String recommendation;
    String suggestion;
    int recommendedMinutes = 0;
    int currentMinutesToday = 0;

    if (needCardio) {
      final intensity = avgIntensity(cardioInts) == 'High' ? 'low' : 'moderate';

      if (goal.contains('lose')) {
        recommendedMinutes = 40;
        suggestion = "Do a 40-minute $intensity cardio session today.";
      } else if (goal.contains('maintain')) {
        recommendedMinutes = 30;
        suggestion = "Do a 30-minute $intensity cardio session to balance your week.";
      } else {
        recommendedMinutes = 25;
        suggestion = "Do a short 25–30 minute $intensity cardio session.";
      }
      recommendation = "Cardio";
      currentMinutesToday = cardioToday;
    } else if (needStrength) {
      final intensity = avgIntensity(strengthInts) == 'High' ? 'low' : 'moderate';

      if (goal.contains('gain')) {
        recommendedMinutes = 60;
        suggestion = "Do a 45–60 minute $intensity strength session today.";
      } else if (goal.contains('maintain')) {
        recommendedMinutes = 40;
        suggestion = "Do a 30–40 minute $intensity strength session to maintain muscle.";
      } else {
        recommendedMinutes = 30;
        suggestion = "Do a 30-minute $intensity strength training session.";
      }
      recommendation = "Strength Training";
      currentMinutesToday = strengthToday;
    } else {
      recommendation = "Rest Day";
      suggestion = "All exercise goals met. Enjoy a well-earned rest!";
      recommendedMinutes = 0;
      currentMinutesToday = 0;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
            child: Text("Recommendation",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
        const SizedBox(height: 10),
        Card(
          color: Colors.grey.shade100,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(recommendation,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(
                  suggestion,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 12),
                if (recommendation != "Rest Day")
                  Text(
                    "Time today: $currentMinutesToday / $recommendedMinutes minutes",
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String _weekdayLabel(DateTime date) {
    switch (date.weekday) {
      case DateTime.sunday:
        return "SUN";
      case DateTime.monday:
        return "MON";
      case DateTime.tuesday:
        return "TUE";
      case DateTime.wednesday:
        return "WED";
      case DateTime.thursday:
        return "THU";
      case DateTime.friday:
        return "FRI";
      case DateTime.saturday:
        return "SAT";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    if (weekData == null || todayData == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Nutrition Tracker")),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  _buildDailyGoalsSection(),
                  const SizedBox(height: 30),
                  _buildWeeklySection(),
                  const SizedBox(height: 30),
                  _buildRecommendationSection(),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.grey.shade200,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('H: ${UserData.heightString}'),
                    Text('W: ${UserData.weightString}'),
                    Text('S: ${UserData.sexString}'),
                    Text('BMI: ${UserData.bmiString}'),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Goal: ${UserData.goalString}'),
                    Text('Age: ${UserData.ageString}'),
                    Text('BMR: ${UserData.bmrString}'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

extension StringCap on String {
  String capitalize() => isEmpty ? this : '${this[0].toUpperCase()}${substring(1)}';
}
