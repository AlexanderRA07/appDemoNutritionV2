// // // update.dart
import 'package:flutter/material.dart';
import '../data/user.dart';
import '../sidebar/drawer.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _feetController;
  late final TextEditingController _inchesController;
  late final TextEditingController _weightController;
  late final TextEditingController _ageController;

  String? _selectedSex;
  String? _selectedGoal;
  double? _bmi;
  double? _bmr;

  @override
  void initState() {
    super.initState();
    _feetController = TextEditingController(text: UserData.feet.toInt().toString());
    _inchesController = TextEditingController(text: UserData.inches.toInt().toString());
    _weightController = TextEditingController(text: UserData.weight.toInt().toString());
    _ageController = TextEditingController(text: UserData.age?.toString() ?? '');
    _selectedSex = UserData.sex == '--' ? null : UserData.sex;
    _selectedGoal = UserData.goal;
    _bmi = UserData.bmi > 0 ? UserData.bmi : null;
    _bmr = UserData.bmr > 0 ? UserData.bmr : null;
  }

  void _calculateMetrics() {
    final feet = double.tryParse(_feetController.text) ?? 0;
    final inches = double.tryParse(_inchesController.text) ?? 0;
    final weight = double.tryParse(_weightController.text) ?? 0;
    final age = int.tryParse(_ageController.text) ?? 0;
    final heightInInches = (feet * 12) + inches;

    // Update UserData
    UserData.feet = feet;
    UserData.inches = inches;
    UserData.weight = weight;
    UserData.age = age;

    // Calculate BMI
    double? newBMI;
    if (heightInInches > 0 && weight > 0) {
      newBMI = (weight / (heightInInches * heightInInches)) * 703;
      newBMI = double.parse(newBMI.toStringAsFixed(1));
    }

    // Calculate BMR
    double? newBMR;
    if (weight > 0 && heightInInches > 0 && age > 0 && _selectedSex != null) {
      if (_selectedSex == 'M') {
        newBMR = 66 + (6.23 * weight) + (12.7 * heightInInches) - (6.8 * age);
      } else if (_selectedSex == 'F') {
        newBMR = 655 + (4.35 * weight) + (4.7 * heightInInches) - (4.7 * age);
      }
      newBMR = double.parse(newBMR!.toStringAsFixed(0));
    }

    setState(() {
      _bmi = newBMI;
      _bmr = newBMR;
    });

    UserData.bmi = _bmi ?? 0;
    UserData.bmr = _bmr ?? 0;
  }

  @override
  void dispose() {
    _feetController.dispose();
    _inchesController.dispose();
    _weightController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Update Info")),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          onChanged: _calculateMetrics,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Update Your Info", style: TextStyle(fontSize: 24)),
              const SizedBox(height: 16),

              // Height input
              Row(
                children: [
                  Flexible(
                    child: TextFormField(
                      controller: _feetController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: "Height (ft)"),
                      validator: (value) {
                        final feet = double.tryParse(value ?? '') ?? -1;
                        if (feet <= 0 || feet > 10) return 'Enter 1–10 ft';
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Flexible(
                    child: TextFormField(
                      controller: _inchesController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: "Height (in)"),
                      validator: (value) {
                        final inches = double.tryParse(value ?? '') ?? -1;
                        if (inches < 0 || inches >= 12) return '0–11 in only';
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Weight input
              TextFormField(
                controller: _weightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Weight (lbs)"),
                validator: (value) {
                  final weight = double.tryParse(value ?? '') ?? -1;
                  if (weight <= 0 || weight > 2000) return '1–2000 lbs only';
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Age input
              TextFormField(
                controller: _ageController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Age"),
                validator: (value) {
                  final age = int.tryParse(value ?? '') ?? -1;
                  if (age < 1 || age > 150) return 'Enter age 1–150';
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Sex dropdown
              DropdownButtonFormField<String>(
                value: _selectedSex,
                items: const [
                  DropdownMenuItem(value: 'M', child: Text("Male")),
                  DropdownMenuItem(value: 'F', child: Text("Female")),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedSex = value;
                    UserData.sex = value ?? '--';
                    _calculateMetrics(); // recalculate if sex changes
                  });
                },
                decoration: const InputDecoration(labelText: "Sex"),
                validator: (value) => (value == null || value.isEmpty) ? 'Select M or F' : null,
              ),
              const SizedBox(height: 24),

              // BMI + BMR display
              Text(
                _bmi == null ? "BMI: --" : "BMI: $_bmi",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                _bmr == null ? "BMR: --" : "BMR: $_bmr calories/day",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),

              // Goal dropdown
              DropdownButtonFormField<String>(
                value: _selectedGoal,
                items: const [
                  DropdownMenuItem(value: 'Maintain Weight', child: Text("Maintain Weight")),
                  DropdownMenuItem(value: 'Reduce Weight', child: Text("Reduce Weight")),
                  DropdownMenuItem(value: 'Gain Muscle', child: Text("Gain Muscle")),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedGoal = value;
                    UserData.goal = value ?? 'Maintain Weight';
                  });
                },
                decoration: const InputDecoration(labelText: "Goal"),
              ),

              const Spacer(),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    UserData.age = int.tryParse(_ageController.text) ?? 0;
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Info saved!")),
                    );
                //    Navigator.pushReplacementNamed(context, '/home');
                  }
                },
                child: const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
