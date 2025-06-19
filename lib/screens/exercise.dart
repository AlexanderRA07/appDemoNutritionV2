//exercise.dart
import 'package:flutter/material.dart';

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add an Exercise")),
      body: const Center(child: Text("Add exercise form")),
    );
  }
}
