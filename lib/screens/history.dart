// history.dart
// lib/screens/history.dart
import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final List<String> months = const ['JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN', 'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC'];
  final List<int> days = List.generate(31, (i) => i + 1);
  final int currentYear = DateTime.now().year;
  late final List<int> years = List.generate(currentYear - 2000 + 1, (i) => currentYear - i);

  String selectedMonth = 'JAN';
  int selectedDay = 1;
  int selectedYear = DateTime.now().year;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('View History')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: selectedMonth,
              decoration: const InputDecoration(labelText: 'Month'),
              items: months.map((m) => DropdownMenuItem(value: m, child: Text(m))).toList(),
              onChanged: (val) => setState(() => selectedMonth = val!),
            ),
            DropdownButtonFormField<int>(
              value: selectedDay,
              decoration: const InputDecoration(labelText: 'Day'),
              items: days.map((d) => DropdownMenuItem(value: d, child: Text(d.toString()))).toList(),
              onChanged: (val) => setState(() => selectedDay = val!),
            ),
            DropdownButtonFormField<int>(
              value: selectedYear,
              decoration: const InputDecoration(labelText: 'Year'),
              items: years.map((y) => DropdownMenuItem(value: y, child: Text(y.toString()))).toList(),
              onChanged: (val) => setState(() => selectedYear = val!),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Fetch/display data for selected date later
              },
              child: const Text('Load History'),
            ),
          ],
        ),
      ),
    );
  }
}
