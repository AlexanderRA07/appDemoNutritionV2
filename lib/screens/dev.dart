// // //dev.dart
// // import 'package:flutter/material.dart';
// //
// // class DevScreen extends StatelessWidget {
// //   const DevScreen({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: const Text("Dev Tools")),
// //       body: const Center(child: Text("Developer tools and debug info")),
// //     );
// //   }
// // }
//
// // dev.dart
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import '../data/day.dart'; // for DayData type registration
//
// class DevScreen extends StatelessWidget {
//   const DevScreen({super.key});
//
//   Future<void> _clearDaysBox(BuildContext context) async {
//     try {
//       final box = Hive.box<DayData>('days');
//       await box.clear();
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('All day entries cleared.')),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error clearing data: $e')),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Dev Tools")),
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const Text("Developer tools and debug info"),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () => _clearDaysBox(context),
//               child: const Text("Clear All Day Data"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../data/day.dart';
import '../data/exercise_entry.dart';

class DevScreen extends StatelessWidget {
  const DevScreen({super.key});

  Future<void> _clearDaysBox(BuildContext context) async {
    try {
      final box = Hive.box<DayData>('days');
      await box.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('All day entries cleared.')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error clearing data: $e')),
      );
    }
  }

  Future<void> _addMockData(BuildContext context) async {
    try {
      final box = Hive.box<DayData>('days');
      final today = DateTime.now();

      final types = ['Cardio', 'Strength', 'Flexibility'];
      final intensities = ['Low', 'Moderate', 'High'];

      for (int i = 13; i >= 0; i--) {
        final date = today.subtract(Duration(days: i));
        final key = '${date.year}-${date.month}-${date.day}';

        final type = types[i % types.length];
        final intensity = intensities[i % intensities.length];

        final exercise = ExerciseEntry(
          type: types[i % types.length],
          duration: 20 + (i * 7) % 40,
          intensity: intensities[i % intensities.length],
          caloriesBurned: 100 + (i * 13) % 200,
        );

        final day = DayData(
          year: date.year,
          month: date.month,
          day: date.day,
          caloriesIn: 1800 + (i * 25) % 400,
          caloriesOut: exercise.caloriesBurned,
          protein: 90 + i % 20,
          carbs: 200 + (i * 10) % 100,
          fat: 60 + i % 10,
          exercises: [exercise],
        );

        await box.put(key, day);
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Mock data with varied exercises added.')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error generating mock data: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dev Tools")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Developer tools and debug info"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _clearDaysBox(context),
              child: const Text("Clear All Day Data"),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => _addMockData(context),
              child: const Text("Add 2 Weeks of Mock Data"),
            ),
          ],
        ),
      ),
    );
  }
}
