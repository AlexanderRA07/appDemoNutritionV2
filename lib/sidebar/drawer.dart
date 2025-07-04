import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
              title: const Text("Home"),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/home');
              }),
          ListTile(
              title: const Text("Update User Info"),
              onTap: () {
                Navigator.pushNamed(context, '/update-user');
              }),
          ListTile(
              title: const Text("Add a Meal"),
              onTap: () {
                Navigator.pushNamed(context, '/add-meal');
              }),
          ListTile(
              title: const Text("Add Exercise"),
              onTap: () {
                Navigator.pushNamed(context, '/add-exercise');
              }),
          ListTile(
              title: const Text("View History"),
              onTap: () {
                Navigator.pushNamed(context, '/history');
              }),
          ListTile(
              title: const Text("Dev Tools"),
              onTap: () {
                Navigator.pushNamed(context, '/dev-tools');
              }),
        ],
      ),
    );
  }
}
