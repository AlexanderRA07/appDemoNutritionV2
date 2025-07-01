// // // // // // // // // home_screen.dart
// // // // // //
// // // // // // import 'package:flutter/material.dart';
// // // // // // import '../data/user.dart';
// // // // // //
// // // // // // class HomeScreen extends StatelessWidget {
// // // // // //   const HomeScreen({super.key});
// // // // // //
// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Scaffold(
// // // // // //       appBar: AppBar(title: const Text("Nutrition Tracker")),
// // // // // //       drawer: Drawer(
// // // // // //         child: ListView(
// // // // // //           children: [
// // // // // //             ListTile(
// // // // // //               title: const Text("Home"),
// // // // // //               onTap: () => Navigator.pushReplacementNamed(context, '/home'),
// // // // // //             ),
// // // // // //             ListTile(
// // // // // //               title: const Text("Update User Info"),
// // // // // //               onTap: () => Navigator.pushNamed(context, '/update-user'),
// // // // // //             ),
// // // // // //             ListTile(
// // // // // //               title: const Text("Add a Meal"),
// // // // // //               onTap: () => Navigator.pushNamed(context, '/add-meal'),
// // // // // //             ),
// // // // // //             ListTile(
// // // // // //               title: const Text("Add Exercise"),
// // // // // //               onTap: () => Navigator.pushNamed(context, '/add-exercise'),
// // // // // //             ),
// // // // // //             ListTile(
// // // // // //               title: const Text("View History"),
// // // // // //               onTap: () => Navigator.pushNamed(context, '/history'),
// // // // // //             ),
// // // // // //             ListTile(
// // // // // //               title: const Text("Dev Tools"),
// // // // // //               onTap: () => Navigator.pushNamed(context, '/dev-tools'),
// // // // // //             ),
// // // // // //           ],
// // // // // //         ),
// // // // // //       ),
// // // // // //
// // // // // //       body: Column(
// // // // // //         children: [
// // // // // //           Expanded(
// // // // // //             child: Column(
// // // // // //               mainAxisAlignment: MainAxisAlignment.center,
// // // // // //               children: const [
// // // // // //                 Text("Daily Stats", style: TextStyle(fontSize: 24)),
// // // // // //                 SizedBox(height: 10),
// // // // // //                 Text("Weekly Stats", style: TextStyle(fontSize: 24)),
// // // // // //               ],
// // // // // //             ),
// // // // // //           ),
// // // // // //
// // // // // //           // Bottom bar with two rows of user info
// // // // // //           Container(
// // // // // //             color: Colors.grey.shade200,
// // // // // //             padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
// // // // // //             child: Column(
// // // // // //               mainAxisSize: MainAxisSize.min,
// // // // // //               children: [
// // // // // //                 // Row 1: Height, Weight, Sex, BMI
// // // // // //                 Row(
// // // // // //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
// // // // // //                   children: [
// // // // // //                     Text('H: ${UserData.heightString}'),
// // // // // //                     Text('W: ${UserData.weightString}'),
// // // // // //                     Text('S: ${UserData.sexString}'),
// // // // // //                     Text('BMI: ${UserData.bmiString}'),
// // // // // //                   ],
// // // // // //                 ),
// // // // // //
// // // // // //                 const SizedBox(height: 8),
// // // // // //
// // // // // //                 // Row 2: Goal, Age, BMR
// // // // // //                 Row(
// // // // // //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
// // // // // //                   children: [
// // // // // //                     Text('Goal: ${UserData.goalString}'),
// // // // // //                     Text('Age: ${UserData.ageString}'),
// // // // // //                     Text('BMR: ${UserData.bmrString}'),
// // // // // //                   ],
// // // // // //                 ),
// // // // // //               ],
// // // // // //             ),
// // // // // //           ),
// // // // // //         ],
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // // }
// // // // //
// // // // // // home.dart
// // // // //
// // // // // import 'package:flutter/material.dart';
// // // // // import '../data/user.dart';
// // // // // import '../data/goal.dart';  // Import the NutritionGoals
// // // // //
// // // // // class HomeScreen extends StatelessWidget {
// // // // //   const HomeScreen({super.key});
// // // // //
// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     final dailyCalories = NutritionGoals.dailyCalories();
// // // // //     final dailyMacros = NutritionGoals.dailyMacros();
// // // // //     final weeklyExercise = NutritionGoals.weeklyExerciseMinutes();
// // // // //
// // // // //     return Scaffold(
// // // // //       appBar: AppBar(title: const Text("Nutrition Tracker")),
// // // // //       drawer: Drawer(
// // // // //         child: ListView(
// // // // //           children: [
// // // // //             ListTile(
// // // // //               title: const Text("Home"),
// // // // //               onTap: () => Navigator.pushReplacementNamed(context, '/home'),
// // // // //             ),
// // // // //             ListTile(
// // // // //               title: const Text("Update User Info"),
// // // // //               onTap: () => Navigator.pushNamed(context, '/update-user'),
// // // // //             ),
// // // // //             ListTile(
// // // // //               title: const Text("Add a Meal"),
// // // // //               onTap: () => Navigator.pushNamed(context, '/add-meal'),
// // // // //             ),
// // // // //             ListTile(
// // // // //               title: const Text("Add Exercise"),
// // // // //               onTap: () => Navigator.pushNamed(context, '/add-exercise'),
// // // // //             ),
// // // // //             ListTile(
// // // // //               title: const Text("View History"),
// // // // //               onTap: () => Navigator.pushNamed(context, '/history'),
// // // // //             ),
// // // // //             ListTile(
// // // // //               title: const Text("Dev Tools"),
// // // // //               onTap: () => Navigator.pushNamed(context, '/dev-tools'),
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //       ),
// // // // //
// // // // //       body: Column(
// // // // //         children: [
// // // // //           Expanded(
// // // // //             child: Padding(
// // // // //               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
// // // // //               child: Column(
// // // // //                 mainAxisAlignment: MainAxisAlignment.center,
// // // // //                 children: [
// // // // //                   const Text("Daily Goals", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
// // // // //                   const SizedBox(height: 15),
// // // // //
// // // // //                   Text('Calories: $dailyCalories kcal', style: const TextStyle(fontSize: 18)),
// // // // //                   Text('Protein: ${dailyMacros['protein']} g', style: const TextStyle(fontSize: 18)),
// // // // //                   Text('Carbs: ${dailyMacros['carbs']} g', style: const TextStyle(fontSize: 18)),
// // // // //                   Text('Fat: ${dailyMacros['fat']} g', style: const TextStyle(fontSize: 18)),
// // // // //
// // // // //                   const SizedBox(height: 40),
// // // // //
// // // // //                   const Text("Weekly Exercise Recommendations", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
// // // // //                   const SizedBox(height: 15),
// // // // //
// // // // //                   Text('Cardio: ${weeklyExercise['cardio']} minutes per week', style: const TextStyle(fontSize: 18)),
// // // // //                   Text('Strength Training: ${weeklyExercise['strength']} minutes per week', style: const TextStyle(fontSize: 18)),
// // // // //                 ],
// // // // //               ),
// // // // //             ),
// // // // //           ),
// // // // //
// // // // //           // Bottom bar with two rows of user info
// // // // //           Container(
// // // // //             color: Colors.grey.shade200,
// // // // //             padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
// // // // //             child: Column(
// // // // //               mainAxisSize: MainAxisSize.min,
// // // // //               children: [
// // // // //                 // Row 1: Height, Weight, Sex, BMI
// // // // //                 Row(
// // // // //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
// // // // //                   children: [
// // // // //                     Text('H: ${UserData.heightString}'),
// // // // //                     Text('W: ${UserData.weightString}'),
// // // // //                     Text('S: ${UserData.sexString}'),
// // // // //                     Text('BMI: ${UserData.bmiString}'),
// // // // //                   ],
// // // // //                 ),
// // // // //
// // // // //                 const SizedBox(height: 8),
// // // // //
// // // // //                 // Row 2: Goal, Age, BMR
// // // // //                 Row(
// // // // //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
// // // // //                   children: [
// // // // //                     Text('Goal: ${UserData.goalString}'),
// // // // //                     Text('Age: ${UserData.ageString}'),
// // // // //                     Text('BMR: ${UserData.bmrString}'),
// // // // //                   ],
// // // // //                 ),
// // // // //               ],
// // // // //             ),
// // // // //           ),
// // // // //         ],
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }
// // // //
// // // // // home.dart
// // // //
// // // // import 'package:flutter/material.dart';
// // // // import '../data/user.dart';
// // // // import '../data/goal.dart';
// // // // import '../data/day_manager.dart';
// // // // import '../data/day.dart';
// // // //
// // // // class HomeScreen extends StatelessWidget {
// // // //   const HomeScreen({super.key});
// // // //
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     final dailyCalories = NutritionGoals.dailyCalories();
// // // //     final dailyMacros = NutritionGoals.dailyMacros();
// // // //     final weeklyExercise = NutritionGoals.weeklyExerciseMinutes();
// // // //
// // // //     final today = DayManager.getToday();
// // // //     final weekData = DayManager.getWeek();
// // // //     final todayData = weekData[today];
// // // //
// // // //     // For table icons
// // // //     Widget getStatusIcon(String metric, int todayVal, int goalVal, int tolerance) {
// // // //       if (NutritionGoals.isBelowMinimum(value: todayVal, goal: goalVal, tolerance: tolerance)) {
// // // //         return const Icon(Icons.remove, color: Colors.orange); // Not yet met
// // // //       } else if (NutritionGoals.isAboveMaximum(value: todayVal, goal: goalVal, tolerance: tolerance)) {
// // // //         return const Icon(Icons.close, color: Colors.red); // Exceeded
// // // //       } else {
// // // //         return const Icon(Icons.check, color: Colors.green); // Met
// // // //       }
// // // //     }
// // // //
// // // //     return Scaffold(
// // // //       appBar: AppBar(title: const Text("Nutrition Tracker")),
// // // //       drawer: Drawer(
// // // //         child: ListView(
// // // //           children: [
// // // //             ListTile(title: const Text("Home"), onTap: () => Navigator.pushReplacementNamed(context, '/home')),
// // // //             ListTile(title: const Text("Update User Info"), onTap: () => Navigator.pushNamed(context, '/update-user')),
// // // //             ListTile(title: const Text("Add a Meal"), onTap: () => Navigator.pushNamed(context, '/add-meal')),
// // // //             ListTile(title: const Text("Add Exercise"), onTap: () => Navigator.pushNamed(context, '/add-exercise')),
// // // //             ListTile(title: const Text("View History"), onTap: () => Navigator.pushNamed(context, '/history')),
// // // //             ListTile(title: const Text("Dev Tools"), onTap: () => Navigator.pushNamed(context, '/dev-tools')),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //
// // // //       body: Column(
// // // //         children: [
// // // //           Expanded(
// // // //             child: Padding(
// // // //               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
// // // //               child: Column(
// // // //                 crossAxisAlignment: CrossAxisAlignment.stretch,
// // // //                 children: [
// // // //                   const Center(child: Text("Daily Goals", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
// // // //                   const SizedBox(height: 15),
// // // //
// // // //                   // Header Row
// // // //                   Row(
// // // //                     mainAxisAlignment: MainAxisAlignment.spaceAround,
// // // //                     children: const [
// // // //                       Expanded(child: Text("Metric", style: TextStyle(fontWeight: FontWeight.bold))),
// // // //                       Expanded(child: Text("Today", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold))),
// // // //                       Expanded(child: Text("Goal", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold))),
// // // //                       Expanded(child: Text("Achieved", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold))),
// // // //                     ],
// // // //                   ),
// // // //
// // // //                   const Divider(),
// // // //
// // // //                   // Protein
// // // //                   Row(
// // // //                     mainAxisAlignment: MainAxisAlignment.spaceAround,
// // // //                     children: [
// // // //                       const Expanded(child: Text("Protein")),
// // // //                       Expanded(child: Text("${todayData.protein} g", textAlign: TextAlign.center)),
// // // //                       Expanded(child: Text("${dailyMacros['protein']} g", textAlign: TextAlign.center)),
// // // //                       Expanded(child: Center(child: getStatusIcon("protein", todayData.protein, dailyMacros['protein']!, NutritionGoals.proteinTolerance))),
// // // //                     ],
// // // //                   ),
// // // //
// // // //                   // Carbs
// // // //                   Row(
// // // //                     mainAxisAlignment: MainAxisAlignment.spaceAround,
// // // //                     children: [
// // // //                       const Expanded(child: Text("Carbs")),
// // // //                       Expanded(child: Text("${todayData.carbs} g", textAlign: TextAlign.center)),
// // // //                       Expanded(child: Text("${dailyMacros['carbs']} g", textAlign: TextAlign.center)),
// // // //                       Expanded(child: Center(child: getStatusIcon("carbs", todayData.carbs, dailyMacros['carbs']!, NutritionGoals.carbsTolerance))),
// // // //                     ],
// // // //                   ),
// // // //
// // // //                   // Fat
// // // //                   Row(
// // // //                     mainAxisAlignment: MainAxisAlignment.spaceAround,
// // // //                     children: [
// // // //                       const Expanded(child: Text("Fat")),
// // // //                       Expanded(child: Text("${todayData.fat} g", textAlign: TextAlign.center)),
// // // //                       Expanded(child: Text("${dailyMacros['fat']} g", textAlign: TextAlign.center)),
// // // //                       Expanded(child: Center(child: getStatusIcon("fat", todayData.fat, dailyMacros['fat']!, NutritionGoals.fatTolerance))),
// // // //                     ],
// // // //                   ),
// // // //
// // // //                   // Calories In
// // // //                   Row(
// // // //                     mainAxisAlignment: MainAxisAlignment.spaceAround,
// // // //                     children: [
// // // //                       const Expanded(child: Text("Cal In")),
// // // //                       Expanded(child: Text("${todayData.caloriesIn} kcal", textAlign: TextAlign.center)),
// // // //                       Expanded(child: Text("$dailyCalories kcal", textAlign: TextAlign.center)),
// // // //                       Expanded(child: Center(child: getStatusIcon("calIn", todayData.caloriesIn, dailyCalories, NutritionGoals.caloriesInTolerance))),
// // // //                     ],
// // // //                   ),
// // // //
// // // //                   const SizedBox(height: 30),
// // // //
// // // //                   const Center(child: Text("Weekly Exercise", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
// // // //                   const SizedBox(height: 15),
// // // //
// // // //                   SizedBox(
// // // //                     height: 120,
// // // //                     child: Row(
// // // //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // // //                       children: weekData.entries.map((entry) {
// // // //                         final isToday = entry.key == today;
// // // //                         final dateData = entry.value;
// // // //                         final totalOut = dateData.caloriesOut;
// // // //
// // // //                         Icon getWeeklyIcon() {
// // // //                           if (NutritionGoals.isBelowMinimum(value: totalOut, goal: dailyCalories, tolerance: NutritionGoals.caloriesOutTolerance)) {
// // // //                             return const Icon(Icons.warning, color: Colors.orange);
// // // //                           } else if (NutritionGoals.isAboveMaximum(value: totalOut, goal: dailyCalories, tolerance: NutritionGoals.caloriesOutTolerance)) {
// // // //                             return const Icon(Icons.close, color: Colors.red);
// // // //                           } else {
// // // //                             return const Icon(Icons.check_circle, color: Colors.green);
// // // //                           }
// // // //                         }
// // // //
// // // //                         return Column(
// // // //                           children: [
// // // //                             Text(entry.key.substring(0, 3).toUpperCase(),
// // // //                                 style: TextStyle(fontWeight: FontWeight.bold, color: isToday ? Colors.green : Colors.black)),
// // // //                             const SizedBox(height: 6),
// // // //                             Text("${dateData.caloriesIn}"),
// // // //                             Text("${totalOut}"),
// // // //                             getWeeklyIcon(),
// // // //                           ],
// // // //                         );
// // // //                       }).toList(),
// // // //                     ),
// // // //                   ),
// // // //                 ],
// // // //               ),
// // // //             ),
// // // //           ),
// // // //
// // // //           // User info bar (do not modify)
// // // //           Container(
// // // //             color: Colors.grey.shade200,
// // // //             padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
// // // //             child: Column(
// // // //               mainAxisSize: MainAxisSize.min,
// // // //               children: [
// // // //                 Row(
// // // //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
// // // //                   children: [
// // // //                     Text('H: ${UserData.heightString}'),
// // // //                     Text('W: ${UserData.weightString}'),
// // // //                     Text('S: ${UserData.sexString}'),
// // // //                     Text('BMI: ${UserData.bmiString}'),
// // // //                   ],
// // // //                 ),
// // // //                 const SizedBox(height: 8),
// // // //                 Row(
// // // //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
// // // //                   children: [
// // // //                     Text('Goal: ${UserData.goalString}'),
// // // //                     Text('Age: ${UserData.ageString}'),
// // // //                     Text('BMR: ${UserData.bmrString}'),
// // // //                   ],
// // // //                 ),
// // // //               ],
// // // //             ),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// // //
// // // import 'package:flutter/material.dart';
// // // import '../data/user.dart';
// // // import '../data/goal.dart';
// // // import '../data/day_manager.dart';
// // // import '../data/day.dart';
// // //
// // // class HomeScreen extends StatefulWidget {
// // //   const HomeScreen({super.key});
// // //
// // //   @override
// // //   State<HomeScreen> createState() => _HomeScreenState();
// // // }
// // //
// // // class _HomeScreenState extends State<HomeScreen> {
// // //   List<DayData>? weekData;
// // //   DayData? todayData;
// // //
// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _loadDayData();
// // //   }
// // //
// // //   Future<void> _loadDayData() async {
// // //     final today = await DayManager.getToday();
// // //     final week = await DayManager.getWeek();
// // //
// // //     setState(() {
// // //       todayData = today;
// // //       weekData = week;
// // //     });
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final dailyCalories = NutritionGoals.dailyCalories();
// // //     final dailyMacros = NutritionGoals.dailyMacros();
// // //     final weeklyExercise = NutritionGoals.weeklyExerciseMinutes();
// // //
// // //     if (weekData == null || todayData == null) {
// // //       return const Scaffold(
// // //         body: Center(child: CircularProgressIndicator()),
// // //       );
// // //     }
// // //
// // //     return Scaffold(
// // //       appBar: AppBar(title: const Text("Nutrition Tracker")),
// // //       drawer: Drawer(
// // //         child: ListView(
// // //           children: [
// // //             ListTile(
// // //               title: const Text("Home"),
// // //               onTap: () => Navigator.pushReplacementNamed(context, '/home'),
// // //             ),
// // //             ListTile(
// // //               title: const Text("Update User Info"),
// // //               onTap: () => Navigator.pushNamed(context, '/update-user'),
// // //             ),
// // //             ListTile(
// // //               title: const Text("Add a Meal"),
// // //               onTap: () => Navigator.pushNamed(context, '/add-meal'),
// // //             ),
// // //             ListTile(
// // //               title: const Text("Add Exercise"),
// // //               onTap: () => Navigator.pushNamed(context, '/add-exercise'),
// // //             ),
// // //             ListTile(
// // //               title: const Text("View History"),
// // //               onTap: () => Navigator.pushNamed(context, '/history'),
// // //             ),
// // //             ListTile(
// // //               title: const Text("Dev Tools"),
// // //               onTap: () => Navigator.pushNamed(context, '/dev-tools'),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //
// // //       body: Column(
// // //         children: [
// // //           // Daily goals display (same as before)
// // //           // Weekly histogram display (build with `weekData` here)
// // //
// // //           // Bottom user data bar (unchanged)
// // //           Container(
// // //             color: Colors.grey.shade200,
// // //             padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
// // //             child: Column(
// // //               mainAxisSize: MainAxisSize.min,
// // //               children: [
// // //                 Row(
// // //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
// // //                   children: [
// // //                     Text('H: ${UserData.heightString}'),
// // //                     Text('W: ${UserData.weightString}'),
// // //                     Text('S: ${UserData.sexString}'),
// // //                     Text('BMI: ${UserData.bmiString}'),
// // //                   ],
// // //                 ),
// // //                 const SizedBox(height: 8),
// // //                 Row(
// // //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
// // //                   children: [
// // //                     Text('Goal: ${UserData.goalString}'),
// // //                     Text('Age: ${UserData.ageString}'),
// // //                     Text('BMR: ${UserData.bmrString}'),
// // //                   ],
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }
// //
// // import 'package:flutter/material.dart';
// // import '../data/user.dart';
// // import '../data/goal.dart';
// // import '../data/day_manager.dart';
// // import '../data/day.dart';
// //
// // class HomeScreen extends StatefulWidget {
// //   const HomeScreen({super.key});
// //
// //   @override
// //   State<HomeScreen> createState() => _HomeScreenState();
// // }
// //
// // class _HomeScreenState extends State<HomeScreen> {
// //   List<DayData>? weekData;
// //   DayData? todayData;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _loadDayData();
// //   }
// //
// //   Future<void> _loadDayData() async {
// //     final today = await DayManager.getToday();
// //     final week = await DayManager.getWeek();
// //
// //     setState(() {
// //       todayData = today;
// //       weekData = week;
// //     });
// //   }
// //
// //   Widget _buildDailyGoalsSection() {
// //     final dailyCalories = NutritionGoals.dailyCalories();
// //     final dailyMacros = NutritionGoals.dailyMacros();
// //
// //     return Column(
// //       children: [
// //         const Center(child: Text("Daily Goals", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
// //         const SizedBox(height: 10),
// //         Table(
// //           border: TableBorder.all(),
// //           columnWidths: const {
// //             0: FlexColumnWidth(2),
// //             1: FlexColumnWidth(2),
// //             2: FlexColumnWidth(2),
// //             3: FlexColumnWidth(1),
// //           },
// //           children: [
// //             const TableRow(
// //               children: [
// //                 Padding(padding: EdgeInsets.all(8), child: Text("Metric", style: TextStyle(fontWeight: FontWeight.bold))),
// //                 Padding(padding: EdgeInsets.all(8), child: Text("Today")),
// //                 Padding(padding: EdgeInsets.all(8), child: Text("Goal")),
// //                 Padding(padding: EdgeInsets.all(8), child: Text("✔")),
// //               ],
// //             ),
// //             ...['calories', 'protein', 'carbs', 'fat'].map((metric) {
// //               final todayVal = _getTodayValue(metric);
// //               final goalVal = _getGoalValue(metric, dailyCalories, dailyMacros);
// //               final statusIcon = _getStatusIcon(metric, todayVal, goalVal);
// //               return TableRow(
// //                 children: [
// //                   Padding(padding: const EdgeInsets.all(8), child: Text(metric.capitalize())),
// //                   Padding(padding: const EdgeInsets.all(8), child: Text("${todayVal}g")),
// //                   Padding(padding: const EdgeInsets.all(8), child: Text("${goalVal}g")),
// //                   Center(child: statusIcon),
// //                 ],
// //               );
// //             }),
// //           ],
// //         ),
// //       ],
// //     );
// //   }
// //
// //   int _getTodayValue(String metric) {
// //     switch (metric) {
// //       case 'calories':
// //         return todayData?.caloriesIn ?? 0;
// //       case 'protein':
// //         return todayData?.protein ?? 0;
// //       case 'carbs':
// //         return todayData?.carbs ?? 0;
// //       case 'fat':
// //         return todayData?.fat ?? 0;
// //       default:
// //         return 0;
// //     }
// //   }
// //
// //   int _getGoalValue(String metric, int calories, Map<String, int> macros) {
// //     switch (metric) {
// //       case 'calories':
// //         return calories;
// //       case 'protein':
// //         return macros['protein'] ?? 0;
// //       case 'carbs':
// //         return macros['carbs'] ?? 0;
// //       case 'fat':
// //         return macros['fat'] ?? 0;
// //       default:
// //         return 0;
// //     }
// //   }
// //
// //   Widget _getStatusIcon(String metric, int actual, int target) {
// //     if (NutritionGoals.isBelow(metric, actual, target)) {
// //       return const Icon(Icons.remove, color: Colors.orange);
// //     } else if (NutritionGoals.isAbove(metric, actual, target)) {
// //       return const Icon(Icons.clear, color: Colors.red);
// //     } else {
// //       return const Icon(Icons.check, color: Colors.green);
// //     }
// //   }
// //
// //   Widget _buildWeeklyHistogram() {
// //     final today = DateTime.now();
// //
// //     return Column(
// //       children: [
// //         const Center(child: Text("Weekly Overview", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
// //         const SizedBox(height: 10),
// //         Row(
// //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //           children: weekData!.map((day) {
// //             final date = DateTime(day.year, day.month, day.day);
// //             final isToday = date.day == today.day && date.month == today.month && date.year == today.year;
// //             final label = _weekdayLabel(date);
// //             final totalOut = day.caloriesOut + NutritionGoals.restingCalories();
// //             final totalIn = day.caloriesIn;
// //             final icon = NutritionGoals.weeklyStatusIcon(totalIn, totalOut);
// //
// //             return Column(
// //               children: [
// //                 Text(label, style: TextStyle(color: isToday ? Colors.green : Colors.black)),
// //                 const SizedBox(height: 4),
// //                 Text("In: $totalIn", style: const TextStyle(fontSize: 12)),
// //                 Text("Out: $totalOut", style: const TextStyle(fontSize: 12)),
// //                 icon,
// //               ],
// //             );
// //           }).toList(),
// //         ),
// //       ],
// //     );
// //   }
// //
// //   String _weekdayLabel(DateTime date) => ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"][date.weekday % 7];
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     if (weekData == null || todayData == null) {
// //       return const Scaffold(
// //         body: Center(child: CircularProgressIndicator()),
// //       );
// //     }
// //
// //     return Scaffold(
// //       appBar: AppBar(title: const Text("Nutrition Tracker")),
// //       drawer: Drawer(
// //         child: ListView(
// //           children: [
// //             ListTile(title: const Text("Home"), onTap: () => Navigator.pushReplacementNamed(context, '/home')),
// //             ListTile(title: const Text("Update User Info"), onTap: () => Navigator.pushNamed(context, '/update-user')),
// //             ListTile(title: const Text("Add a Meal"), onTap: () => Navigator.pushNamed(context, '/add-meal')),
// //             ListTile(title: const Text("Add Exercise"), onTap: () => Navigator.pushNamed(context, '/add-exercise')),
// //             ListTile(title: const Text("View History"), onTap: () => Navigator.pushNamed(context, '/history')),
// //             ListTile(title: const Text("Dev Tools"), onTap: () => Navigator.pushNamed(context, '/dev-tools')),
// //           ],
// //         ),
// //       ),
// //       body: Column(
// //         children: [
// //           Expanded(
// //             child: SingleChildScrollView(
// //               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
// //               child: Column(
// //                 children: [
// //                   _buildDailyGoalsSection(),
// //                   const SizedBox(height: 30),
// //                   _buildWeeklyHistogram(),
// //                 ],
// //               ),
// //             ),
// //           ),
// //           Container(
// //             color: Colors.grey.shade200,
// //             padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
// //             child: Column(
// //               mainAxisSize: MainAxisSize.min,
// //               children: [
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
// //                   children: [
// //                     Text('H: ${UserData.heightString}'),
// //                     Text('W: ${UserData.weightString}'),
// //                     Text('S: ${UserData.sexString}'),
// //                     Text('BMI: ${UserData.bmiString}'),
// //                   ],
// //                 ),
// //                 const SizedBox(height: 8),
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
// //                   children: [
// //                     Text('Goal: ${UserData.goalString}'),
// //                     Text('Age: ${UserData.ageString}'),
// //                     Text('BMR: ${UserData.bmrString}'),
// //                   ],
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
// // extension StringCap on String {
// //   String capitalize() => isEmpty ? this : '${this[0].toUpperCase()}${substring(1)}';
// // }
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
// class _HomeScreenState extends State<HomeScreen> {
//   List<DayData>? weekData;
//   DayData? todayData;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadDayData();
//   }
//
//   Future<void> _loadDayData() async {
//     final today = await DayManager.getToday();
//     final week = await DayManager.getWeek();
//
//     setState(() {
//       todayData = today;
//       weekData = week;
//     });
//   }
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
//   String _weekdayLabel(DateTime date) =>
//       ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"][date.weekday % 7];
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
    // Called when the widget is rebuilt and could be shown again (e.g. after navigation back)
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

  Widget _buildWeeklyHistogram() {
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
            final totalOut = day.caloriesOut + NutritionGoals.restingCalories();
            final totalIn = day.caloriesIn;
            final iconStr = NutritionGoals.weeklyStatusIcon(totalIn, totalOut);

            return Column(
              children: [
                Text(label,
                    style: TextStyle(
                        color: isToday ? Colors.green : Colors.black,
                        fontWeight: isToday ? FontWeight.bold : FontWeight.normal)),
                const SizedBox(height: 4),
                Text("In: $totalIn", style: const TextStyle(fontSize: 12)),
                Text("Out: $totalOut", style: const TextStyle(fontSize: 12)),
                Text(iconStr, style: const TextStyle(fontSize: 20)),
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
                  _buildWeeklyHistogram(),
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
