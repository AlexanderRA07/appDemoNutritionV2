// // // // // //exercise.dart
//
// import 'package:flutter/material.dart';
//
// class ExerciseScreen extends StatefulWidget {
//   const ExerciseScreen({super.key});
//
//   @override
//   State<ExerciseScreen> createState() => _ExerciseScreenState();
// }
//
// class _ExerciseScreenState extends State<ExerciseScreen> {
//   final _formKey = GlobalKey<FormState>();
//
//   final exerciseTypes = ['Cardio', 'Strength Training'];
//   String selectedExerciseType = 'Cardio';
//
//   final intensityLevels = ['Low', 'Moderate', 'High'];
//   String selectedIntensity = 'Moderate';
//
//   final durationController = TextEditingController();
//   final caloriesController = TextEditingController();
//
//   @override
//   void dispose() {
//     durationController.dispose();
//     caloriesController.dispose();
//     super.dispose();
//   }
//
//   String? validatePositiveInt(String? value) {
//     if (value == null || value.isEmpty) return 'Required';
//     final intVal = int.tryParse(value);
//     if (intVal == null || intVal <= 0) return 'Enter number > 0';
//     return null;
//   }
//
//   Widget _centeredInput(String label, TextEditingController controller) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10.0),
//       child: Column(
//         children: [
//           Text(label, style: const TextStyle(fontSize: 16)),
//           TextFormField(
//             controller: controller,
//             keyboardType: TextInputType.number,
//             textInputAction: TextInputAction.done,
//             enableSuggestions: false,
//             autocorrect: false,
//             validator: validatePositiveInt,
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final double buttonWidth = MediaQuery.of(context).size.width * 0.5;
//
//     return Scaffold(
//       appBar: AppBar(title: const Text('Log Exercise')),
//       body: GestureDetector(
//         onTap: () => FocusScope.of(context).unfocus(),
//         child: Center(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.all(20),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   const Text('Exercise Type', style: TextStyle(fontSize: 16)),
//                   DropdownButtonFormField<String>(
//                     value: selectedExerciseType,
//                     items: exerciseTypes
//                         .map((type) => DropdownMenuItem(value: type, child: Center(child: Text(type))))
//                         .toList(),
//                     onChanged: (val) => setState(() => selectedExerciseType = val!),
//                   ),
//                   _centeredInput('Duration (minutes)', durationController),
//                   const Text('Intensity', style: TextStyle(fontSize: 16)),
//                   DropdownButtonFormField<String>(
//                     value: selectedIntensity,
//                     items: intensityLevels
//                         .map((level) => DropdownMenuItem(value: level, child: Center(child: Text(level))))
//                         .toList(),
//                     onChanged: (val) => setState(() => selectedIntensity = val!),
//                   ),
//                   _centeredInput('Calories Burned', caloriesController),
//                   const SizedBox(height: 20),
//                   SizedBox(
//                     width: buttonWidth,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         if (_formKey.currentState!.validate()) {
//                           // Save logic later
//                         }
//                       },
//                       child: const Text('Save Exercise'),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// exercise.dart

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../data/exercise_entry.dart';
import '../data/day.dart';
import '../sidebar/drawer.dart';

class ExerciseScreen extends StatefulWidget {
  const ExerciseScreen({super.key});

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  final _formKey = GlobalKey<FormState>();

  final exerciseTypes = ['Cardio', 'Strength Training'];
  String selectedExerciseType = 'Cardio';

  final intensityLevels = ['Low', 'Moderate', 'High'];
  String selectedIntensity = 'Moderate';

  final durationController = TextEditingController();
  final caloriesController = TextEditingController();

  @override
  void dispose() {
    durationController.dispose();
    caloriesController.dispose();
    super.dispose();
  }

  String? validatePositiveInt(String? value) {
    if (value == null || value.isEmpty) return 'Required';
    final intVal = int.tryParse(value);
    if (intVal == null || intVal <= 0) return 'Enter number > 0';
    return null;
  }

  Widget _centeredInput(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Text(label, style: const TextStyle(fontSize: 16)),
          TextFormField(
            controller: controller,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            enableSuggestions: false,
            autocorrect: false,
            validator: validatePositiveInt,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Future<DayData> getOrCreateTodayDayData() async {
    final box = Hive.box<DayData>('days');
    final now = DateTime.now();
    final key = '${now.year}-${now.month}-${now.day}';

    DayData? today = box.get(key);
    if (today == null) {
      today = DayData(year: now.year, month: now.month, day: now.day);
      await box.put(key, today);
    }
    return today;
  }

  void saveExercise() async {
    if (!_formKey.currentState!.validate()) return;

    final int duration = int.parse(durationController.text);
    final int caloriesBurned = int.parse(caloriesController.text);

    final exercise = ExerciseEntry(
      type: selectedExerciseType,
      duration: duration,
      intensity: selectedIntensity,
      caloriesBurned: caloriesBurned,
    );

    final dayData = await getOrCreateTodayDayData();
    dayData.addExercise(exercise);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Exercise saved!')),
    );

    //Navigator.pop(context); // optional: go back after saving
  }

  @override
  Widget build(BuildContext context) {
    final double buttonWidth = MediaQuery.of(context).size.width * 0.5;

    return Scaffold(
      appBar: AppBar(title: const Text('Log Exercise')),
      drawer: const AppDrawer(),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Text('Exercise Type', style: TextStyle(fontSize: 16)),
                  DropdownButtonFormField<String>(
                    value: selectedExerciseType,
                    items: exerciseTypes
                        .map((type) => DropdownMenuItem(
                              value: type,
                              child: Center(child: Text(type)),
                            ))
                        .toList(),
                    onChanged: (val) => setState(() => selectedExerciseType = val!),
                  ),
                  _centeredInput('Duration (minutes)', durationController),
                  const Text('Intensity', style: TextStyle(fontSize: 16)),
                  DropdownButtonFormField<String>(
                    value: selectedIntensity,
                    items: intensityLevels
                        .map((level) => DropdownMenuItem(
                              value: level,
                              child: Center(child: Text(level)),
                            ))
                        .toList(),
                    onChanged: (val) => setState(() => selectedIntensity = val!),
                  ),
                  _centeredInput('Calories Burned', caloriesController),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: buttonWidth,
                    child: ElevatedButton(
                      onPressed: saveExercise,
                      child: const Text('Save Exercise'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
