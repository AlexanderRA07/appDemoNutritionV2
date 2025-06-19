// main.dart
import 'package:flutter/material.dart';

import 'data/user.dart';

import 'screens/home.dart';
import 'screens/update.dart';
import 'screens/meal.dart';
import 'screens/exercise.dart';
import 'screens/history.dart';
import 'screens/stats.dart';
import 'screens/dev.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simply Nutrition',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Set your actual home screen
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/home': (context) => const HomeScreen(),
        '/update-user': (context) => const UpdateScreen(),
        '/add-meal': (context) => const MealScreen(),
        '/add-exercise': (context) => const ExerciseScreen(),
        '/history': (context) => const HistoryScreen(),
        '/stats': (context) => const StatsScreen(),
        '/dev-tools': (context) => const DevScreen(),
      },
    );
  }
}
