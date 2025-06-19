// // // home_screen.dart
// // import 'package:flutter/material.dart';
// // import '../data/user.dart';
// //
// // class HomeScreen extends StatelessWidget {
// //   const HomeScreen({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: const Text("Nutrition Tracker")),
// //       drawer: Drawer(
// //         child: ListView(
// //           children: [
// //             ListTile(
// //               title: const Text("Home"),
// //               onTap: () => Navigator.pushReplacementNamed(context, '/home'),
// //             ),
// //             ListTile(
// //               title: const Text("Update User Info"),
// //               onTap: () => Navigator.pushNamed(context, '/update-user'),
// //             ),
// //             ListTile(
// //               title: const Text("Add a Meal"),
// //               onTap: () => Navigator.pushNamed(context, '/add-meal'),
// //             ),
// //             ListTile(
// //               title: const Text("Add Exercise"),
// //               onTap: () => Navigator.pushNamed(context, '/add-exercise'),
// //             ),
// //             ListTile(
// //               title: const Text("View History"),
// //               onTap: () => Navigator.pushNamed(context, '/history'),
// //             ),
// //             ListTile(
// //               title: const Text("Dev Tools"),
// //               onTap: () => Navigator.pushNamed(context, '/dev-tools'),
// //             ),
// //           ],
// //         ),
// //       ),
// //
// //       body: Column(
// //         children: const [
// //           Text("Daily Stats", style: TextStyle(fontSize: 24)),
// //           SizedBox(height: 10),
// //           Text("Weekly Stats", style: TextStyle(fontSize: 24)),
// //         ],
// //       ),
// //     );
// //   }
// // }
//
//
// import 'package:flutter/material.dart';
// import '../data/user.dart';
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Nutrition Tracker")),
//       drawer: Drawer(
//         child: ListView(
//           children: [
//             ListTile(
//               title: const Text("Home"),
//               onTap: () => Navigator.pushReplacementNamed(context, '/home'),
//             ),
//             ListTile(
//               title: const Text("Update User Info"),
//               onTap: () => Navigator.pushNamed(context, '/update-user'),
//             ),
//             ListTile(
//               title: const Text("Add a Meal"),
//               onTap: () => Navigator.pushNamed(context, '/add-meal'),
//             ),
//             ListTile(
//               title: const Text("Add Exercise"),
//               onTap: () => Navigator.pushNamed(context, '/add-exercise'),
//             ),
//             ListTile(
//               title: const Text("View History"),
//               onTap: () => Navigator.pushNamed(context, '/history'),
//             ),
//             ListTile(
//               title: const Text("Dev Tools"),
//               onTap: () => Navigator.pushNamed(context, '/dev-tools'),
//             ),
//           ],
//         ),
//       ),
//
//       body: Column(
//         children: [
//           // This expands the existing stats section to fill available space
//           Expanded(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: const [
//                 Text("Daily Stats", style: TextStyle(fontSize: 24)),
//                 SizedBox(height: 10),
//                 Text("Weekly Stats", style: TextStyle(fontSize: 24)),
//               ],
//             ),
//           ),
//
//           // Bottom bar with user data
//           Container(
//             color: Colors.grey.shade200,
//             padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Text('H: ${UserData.heightString}'),
//                 Text('W: ${UserData.weightString}'),
//                 Text('S: ${UserData.sexString}'),
//                 Text('BMI: ${UserData.bmiString}'),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../data/user.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Nutrition Tracker")),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text("Home"),
              onTap: () => Navigator.pushReplacementNamed(context, '/home'),
            ),
            ListTile(
              title: const Text("Update User Info"),
              onTap: () => Navigator.pushNamed(context, '/update-user'),
            ),
            ListTile(
              title: const Text("Add a Meal"),
              onTap: () => Navigator.pushNamed(context, '/add-meal'),
            ),
            ListTile(
              title: const Text("Add Exercise"),
              onTap: () => Navigator.pushNamed(context, '/add-exercise'),
            ),
            ListTile(
              title: const Text("View History"),
              onTap: () => Navigator.pushNamed(context, '/history'),
            ),
            ListTile(
              title: const Text("Dev Tools"),
              onTap: () => Navigator.pushNamed(context, '/dev-tools'),
            ),
          ],
        ),
      ),

      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Daily Stats", style: TextStyle(fontSize: 24)),
                SizedBox(height: 10),
                Text("Weekly Stats", style: TextStyle(fontSize: 24)),
              ],
            ),
          ),

          // Bottom bar with two rows of user info
          Container(
            color: Colors.grey.shade200,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Row 1: Height, Weight, Sex, BMI
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('H: ${UserData.heightString}'),
                    Text('W: ${UserData.weightString}'),
                    Text('S: ${UserData.sexString}'),
                    Text('BMI: ${UserData.bmiString}'),
                  ],
                ),

                const SizedBox(height: 8),

                // Row 2: Goal, Age, BMR
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Goal: ${UserData.goalString}'),
                    Text('Age: ${UserData.ageString}'),
                    Text('BMR: ${UserData.bmrString}'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
