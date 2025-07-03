// // home_screen.dart
//
//
// import 'package:flutter/material.dart';
// import '../data/user.dart';
// import '../data/goal.dart';
// import '../data/day_manager.dart';
// import '../data/day.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
//   List<DayData>? weekData;
//   DayData? todayData;
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);
//     _loadDayData();
//   }
//
//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     super.dispose();
//   }
//
//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     if (state == AppLifecycleState.resumed) {
//       _loadDayData();
//     }
//   }
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     // Called when the widget is rebuilt and could be shown again (e.g. after navigation back)
//     _loadDayData();
//   }
//
//   Future<void> _loadDayData() async {
//     final today = await DayManager.getToday();
//     final week = await DayManager.getWeek();
//
//     // Sort weekData by weekday with Sunday first
//     week.sort((a, b) {
//       int aWeekday = DateTime(a.year, a.month, a.day).weekday;
//       int bWeekday = DateTime(b.year, b.month, b.day).weekday;
//       int mapWeekday(int d) => d == DateTime.sunday ? 0 : d;
//       return mapWeekday(aWeekday).compareTo(mapWeekday(bWeekday));
//     });
//
//     setState(() {
//       todayData = today;
//       weekData = week;
//     });
//   }
//
//
//   Widget _buildDailyGoalsSection() {
//     final dailyCalories = NutritionGoals.dailyCalories();
//     final dailyMacros = NutritionGoals.dailyMacros();
//
//     return Column(
//       children: [
//         const Center(
//             child: Text("Daily Goals",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
//         const SizedBox(height: 10),
//         Table(
//           border: TableBorder.all(),
//           columnWidths: const {
//             0: FlexColumnWidth(2),
//             1: FlexColumnWidth(2),
//             2: FlexColumnWidth(2),
//             3: FlexColumnWidth(1),
//           },
//           children: [
//             const TableRow(
//               children: [
//                 Padding(
//                     padding: EdgeInsets.all(8),
//                     child: Text("Metric",
//                         style: TextStyle(fontWeight: FontWeight.bold))),
//                 Padding(
//                     padding: EdgeInsets.all(8),
//                     child: Text("Today",
//                         style: TextStyle(fontWeight: FontWeight.bold))),
//                 Padding(
//                     padding: EdgeInsets.all(8),
//                     child: Text("Goal",
//                         style: TextStyle(fontWeight: FontWeight.bold))),
//                 Padding(
//                     padding: EdgeInsets.all(8),
//                     child: Text("Status",
//                         style: TextStyle(fontWeight: FontWeight.bold))),
//               ],
//             ),
//             ...['calories', 'protein', 'carbs', 'fat'].map((metric) {
//               final todayVal = _getTodayValue(metric);
//               final goalVal = _getGoalValue(metric, dailyCalories, dailyMacros);
//               final statusIcon = _getStatusIcon(metric, todayVal, goalVal);
//               return TableRow(
//                 children: [
//                   Padding(
//                       padding: const EdgeInsets.all(8),
//                       child: Text(metric.capitalize())),
//                   Padding(
//                       padding: const EdgeInsets.all(8),
//                       child: Text(
//                           metric == 'calories' ? "$todayVal" : "${todayVal}g")),
//                   Padding(
//                       padding: const EdgeInsets.all(8),
//                       child: Text(
//                           metric == 'calories' ? "$goalVal" : "${goalVal}g")),
//                   Center(child: statusIcon),
//                 ],
//               );
//             }),
//           ],
//         ),
//       ],
//     );
//   }
//
//   int _getTodayValue(String metric) {
//     switch (metric) {
//       case 'calories':
//         return todayData?.caloriesIn ?? 0;
//       case 'protein':
//         return todayData?.protein ?? 0;
//       case 'carbs':
//         return todayData?.carbs ?? 0;
//       case 'fat':
//         return todayData?.fat ?? 0;
//       default:
//         return 0;
//     }
//   }
//
//   int _getGoalValue(String metric, int calories, Map<String, int> macros) {
//     switch (metric) {
//       case 'calories':
//         return calories;
//       case 'protein':
//         return macros['protein'] ?? 0;
//       case 'carbs':
//         return macros['carbs'] ?? 0;
//       case 'fat':
//         return macros['fat'] ?? 0;
//       default:
//         return 0;
//     }
//   }
//
//   Widget _getStatusIcon(String metric, int actual, int target) {
//     if (NutritionGoals.isBelow(metric, actual, target)) {
//       return const Icon(Icons.remove, color: Colors.orange);
//     } else if (NutritionGoals.isAbove(metric, actual, target)) {
//       return const Icon(Icons.clear, color: Colors.red);
//     } else {
//       return const Icon(Icons.check, color: Colors.green);
//     }
//   }
//
//   Widget _buildWeeklyHistogram() {
//     final today = DateTime.now();
//
//     return Column(
//       children: [
//         const Center(
//             child: Text("Weekly Overview",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
//         const SizedBox(height: 10),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: weekData!.map((day) {
//             final date = DateTime(day.year, day.month, day.day);
//             final isToday =
//                 date.day == today.day && date.month == today.month && date.year == today.year;
//             final label = _weekdayLabel(date);
//             final totalOut = day.caloriesOut + NutritionGoals.restingCalories();
//             final totalIn = day.caloriesIn;
//             final iconStr = NutritionGoals.weeklyStatusIcon(totalIn, totalOut);
//
//             return Column(
//               children: [
//                 Text(label,
//                     style: TextStyle(
//                         color: isToday ? Colors.green : Colors.black,
//                         fontWeight: isToday ? FontWeight.bold : FontWeight.normal)),
//                 const SizedBox(height: 4),
//                 Text("In: $totalIn", style: const TextStyle(fontSize: 12)),
//                 Text("Out: $totalOut", style: const TextStyle(fontSize: 12)),
//                 Text(iconStr, style: const TextStyle(fontSize: 20)),
//               ],
//             );
//           }).toList(),
//         ),
//       ],
//     );
//   }
//
//   String _weekdayLabel(DateTime date) {
//     switch (date.weekday) {
//       case DateTime.sunday:
//         return "SUN";
//       case DateTime.monday:
//         return "MON";
//       case DateTime.tuesday:
//         return "TUE";
//       case DateTime.wednesday:
//         return "WED";
//       case DateTime.thursday:
//         return "THU";
//       case DateTime.friday:
//         return "FRI";
//       case DateTime.saturday:
//         return "SAT";
//       default:
//         return "";
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (weekData == null || todayData == null) {
//       return const Scaffold(
//         body: Center(child: CircularProgressIndicator()),
//       );
//     }
//
//     return Scaffold(
//       appBar: AppBar(title: const Text("Nutrition Tracker")),
//       drawer: Drawer(
//         child: ListView(
//           children: [
//             ListTile(
//                 title: const Text("Home"),
//                 onTap: () => Navigator.pushReplacementNamed(context, '/home')),
//             ListTile(
//                 title: const Text("Update User Info"),
//                 onTap: () => Navigator.pushNamed(context, '/update-user')),
//             ListTile(
//                 title: const Text("Add a Meal"),
//                 onTap: () => Navigator.pushNamed(context, '/add-meal')),
//             ListTile(
//                 title: const Text("Add Exercise"),
//                 onTap: () => Navigator.pushNamed(context, '/add-exercise')),
//             ListTile(
//                 title: const Text("View History"),
//                 onTap: () => Navigator.pushNamed(context, '/history')),
//             ListTile(
//                 title: const Text("Dev Tools"),
//                 onTap: () => Navigator.pushNamed(context, '/dev-tools')),
//           ],
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//               child: Column(
//                 children: [
//                   _buildDailyGoalsSection(),
//                   const SizedBox(height: 30),
//                   _buildWeeklyHistogram(),
//                 ],
//               ),
//             ),
//           ),
//           Container(
//             color: Colors.grey.shade200,
//             padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Text('H: ${UserData.heightString}'),
//                     Text('W: ${UserData.weightString}'),
//                     Text('S: ${UserData.sexString}'),
//                     Text('BMI: ${UserData.bmiString}'),
//                   ],
//                 ),
//                 const SizedBox(height: 8),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Text('Goal: ${UserData.goalString}'),
//                     Text('Age: ${UserData.ageString}'),
//                     Text('BMR: ${UserData.bmrString}'),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// extension StringCap on String {
//   String capitalize() =>
//       isEmpty ? this : '${this[0].toUpperCase()}${substring(1)}';
// }


import 'package:flutter/material.dart';
import '../data/user.dart';
import '../data/goal.dart';
import '../data/day_manager.dart';
import '../data/day.dart';

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
            0: FlexColumnWidth(2),
            1: FlexColumnWidth(2),
            2: FlexColumnWidth(2),
            3: FlexColumnWidth(1),
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

  // Helper to get metric value from any DayData
  int _getMetricValue(DayData day, String metric) {
    switch (metric) {
      case 'calories':
        return day.caloriesIn;
      case 'protein':
        return day.protein;
      case 'carbs':
        return day.carbs;
      case 'fat':
        return day.fat;
      default:
        return 0;
    }
  }

  Widget _getDailyStatusIconForDay(DayData day, bool isToday) {
    // No data (no meals, no exercise)
    if ((day.meals.isEmpty) && (day.exercises.isEmpty)) {
      return const Icon(Icons.error_outline, color: Colors.yellow);
    }

    final dailyCalories = NutritionGoals.dailyCalories();
    final dailyMacros = NutritionGoals.dailyMacros();

    bool anyExceeded = false;
    bool allMet = true;

    // Check calories
    final caloriesIn = day.caloriesIn;
    if (NutritionGoals.isAbove('calories', caloriesIn, dailyCalories)) {
      anyExceeded = true;
    }
    if (NutritionGoals.isBelow('calories', caloriesIn, dailyCalories)) {
      allMet = false;
    }

    // Check protein, carbs, fat
    for (final metric in ['protein', 'carbs', 'fat']) {
      final val = _getMetricValue(day, metric);
      final goal = dailyMacros[metric] ?? 0;
      if (NutritionGoals.isAbove(metric, val, goal)) {
        anyExceeded = true;
      }
      if (NutritionGoals.isBelow(metric, val, goal)) {
        allMet = false;
      }
    }

    if (anyExceeded) {
      return const Icon(Icons.clear, color: Colors.red);
    }

    if (isToday) {
      if (allMet) {
        return const Icon(Icons.check, color: Colors.green);
      } else {
        return const Icon(Icons.remove, color: Colors.grey);
      }
    } else {
      // For past days, orange if not met, green if all met
      return allMet
          ? const Icon(Icons.check, color: Colors.green)
          : const Icon(Icons.remove, color: Colors.orange);
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
            final totalOut = NutritionGoals.restingCalories() + day.caloriesOut;
            final totalIn = day.caloriesIn;
            final icon = _getDailyStatusIconForDay(day, isToday);

            return Column(
              children: [
                Text(label,
                    style: TextStyle(
                        color: isToday ? Colors.green : Colors.black,
                        fontWeight: isToday ? FontWeight.bold : FontWeight.normal)),
                const SizedBox(height: 4),
                Text("In: $totalIn", style: const TextStyle(fontSize: 12)),
                Text("Out: $totalOut", style: const TextStyle(fontSize: 12)),
                icon,
              ],
            );
          }).toList(),
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
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Nutrition Tracker")),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
                title: const Text("Home"),
                onTap: () => Navigator.pushReplacementNamed(context, '/home')),
            ListTile(
                title: const Text("Update User Info"),
                onTap: () => Navigator.pushNamed(context, '/update-user')),
            ListTile(
                title: const Text("Add a Meal"),
                onTap: () => Navigator.pushNamed(context, '/add-meal')),
            ListTile(
                title: const Text("Add Exercise"),
                onTap: () => Navigator.pushNamed(context, '/add-exercise')),
            ListTile(
                title: const Text("View History"),
                onTap: () => Navigator.pushNamed(context, '/history')),
            ListTile(
                title: const Text("Dev Tools"),
                onTap: () => Navigator.pushNamed(context, '/dev-tools')),
          ],
        ),
      ),
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
  String capitalize() =>
      isEmpty ? this : '${this[0].toUpperCase()}${substring(1)}';
}
