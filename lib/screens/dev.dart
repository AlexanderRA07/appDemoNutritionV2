//dev.dart


import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../data/day.dart';
import '../data/exercise_entry.dart';
import '../sidebar/drawer.dart';

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

      // For each of past 14 days (including today)
      for (int i = 13; i >= 0; i--) {
        final date = today.subtract(Duration(days: i));
        final key = '${date.year}-${date.month}-${date.day}';

        // 1 hour moderate cardio entry
        final exercise = ExerciseEntry(
          type: 'Cardio',
          duration: 60,
          intensity: 'Moderate',
          caloriesBurned: 400, // Approximate calories burned for 1hr moderate cardio
        );

        final day = DayData(
          year: date.year,
          month: date.month,
          day: date.day,
          caloriesIn: 2000,  // Static nutrition data for mock
          caloriesOut: exercise.caloriesBurned,
          protein: 100,
          carbs: 250,
          fat: 70,
          exercises: [exercise],
        );

        await box.put(key, day);
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('2 weeks of 1 hour moderate cardio data added.')),
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
      drawer: const AppDrawer(),
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
