// main.dart

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'data/day.dart';
import 'data/meal_entry.dart';
import 'data/exercise_entry.dart';
import 'data/user.dart';

import 'screens/home.dart';
import 'screens/update.dart';
import 'screens/meal.dart';
import 'screens/exercise.dart';
import 'screens/history.dart';
import 'screens/stats.dart';
import 'screens/dev.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive with Flutter support
  await Hive.initFlutter();

  // Register Hive adapters
  Hive.registerAdapter(DayDataAdapter());
  Hive.registerAdapter(MealEntryAdapter());
  Hive.registerAdapter(ExerciseEntryAdapter());

  // Open the Hive box before running the app
  await Hive.openBox<DayData>('days');

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
