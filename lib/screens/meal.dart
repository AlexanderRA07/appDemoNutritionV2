// lib/screens/meal.dart

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../data/meal_entry.dart';
import '../data/day.dart';
import '../sidebar/drawer.dart';

class MealScreen extends StatefulWidget {
  const MealScreen({super.key});

  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  final _formKey = GlobalKey<FormState>();

  final mealTypes = ['Breakfast', 'Lunch', 'Dinner', 'Snack'];
  String selectedMeal = 'Breakfast';

  final caloriesController = TextEditingController();
  final proteinController = TextEditingController();
  final carbsController = TextEditingController();
  final fatsController = TextEditingController();

  @override
  void dispose() {
    caloriesController.dispose();
    proteinController.dispose();
    carbsController.dispose();
    fatsController.dispose();
    super.dispose();
  }

  String? validatePositiveInt(String? value) {
    if (value == null || value.isEmpty) return 'Required';
    final intVal = int.tryParse(value);
    if (intVal == null || intVal < 0) return 'Enter number ≥ 0';
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

  void saveMeal() async {
    if (!_formKey.currentState!.validate()) return;

    final int calories = int.parse(caloriesController.text);
    final int protein = int.parse(proteinController.text);
    final int carbs = int.parse(carbsController.text);
    final int fats = int.parse(fatsController.text);

    final meal = MealEntry(
      type: selectedMeal,
      calories: calories,
      protein: protein,
      carbs: carbs,
      fat: fats,
    );

    final dayData = await getOrCreateTodayDayData();
    dayData.addMeal(meal);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Meal saved!')),
    );

    //Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final double buttonWidth = MediaQuery.of(context).size.width * 0.5;

    return Scaffold(
      appBar: AppBar(title: const Text('Log Meal')),
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
                  const Text('Meal Type', style: TextStyle(fontSize: 16)),
                  DropdownButtonFormField<String>(
                    value: selectedMeal,
                    items: mealTypes
                        .map((type) => DropdownMenuItem(
                              value: type,
                              child: Center(child: Text(type)),
                            ))
                        .toList(),
                    onChanged: (value) => setState(() => selectedMeal = value!),
                    selectedItemBuilder: (BuildContext context) {
                      return mealTypes.map((type) {
                        return Center(
                          child: Text(
                            selectedMeal,
                            style: const TextStyle(color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        );
                      }).toList();
                    },
                  ),
                  _centeredInput('Calories', caloriesController),
                  _centeredInput('Protein (g)', proteinController),
                  _centeredInput('Carbs (g)', carbsController),
                  _centeredInput('Fats (g)', fatsController),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: buttonWidth,
                    child: ElevatedButton(
                      onPressed: saveMeal,
                      child: const Text('Save Meal'),
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
