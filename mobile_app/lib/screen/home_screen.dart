import 'package:flutter/material.dart';
import 'package:mobile_app/habit.dart';
import 'package:mobile_app/screen/health_screen.dart';
import 'package:mobile_app/screen/hobbies_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Habit> healthHabits = []; // Store all health habits
  List<Habit> hobbiesHabits = []; // Store all hobbies habits

  // Method to update new health habits
  void updateHealthNewHabits(List<Habit> newHabits) {
    setState(() {
      healthHabits = newHabits;
    });
  }

  // Method to update new hobbies habits
  void updateHobbiesNewHabits(List<Habit> newHabits) {
    setState(() {
      hobbiesHabits = newHabits;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Habit Tracker', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF0B0C10), // AppBar color
      ),
      body: Container(
        color: Color(0xFF1F2833), // Background color
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Title
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Dashboard',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white), // Dashboard text color
                ),
              ),
              // Health Summary section
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Health Summary',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF66FCF1)), // Summary text color
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    // Display completed habits
                    ...healthHabits
                        .where((habit) => habit.completed)
                        .map((habit) => ListTile(
                              title: Text(habit.name, style: TextStyle(color: Color(0xFFC5C6C7))), // Habit name color
                              leading: const Icon(Icons.check_box, color: Colors.green),
                            )),
                  ],
                ),
              ),
              // Hobbies Summary section
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Hobbies Summary',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF66FCF1)), // Summary text color
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    ...hobbiesHabits
                        .where((habit) => habit.completed)
                        .map((habit) => ListTile(
                              title: Text(habit.name, style: TextStyle(color: Color(0xFFC5C6C7))), // Habit name color
                              leading: const Icon(Icons.check_box, color: Colors.green),
                            )),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HealthScreen(
                            habits: healthHabits, // Pass health habits
                            updateNewHabits: updateHealthNewHabits,
                          ),
                        ),
                      );
                    },
                    child: const Text('Health Habits', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF45A29E), // Button color
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HobbieScreen(
                            habits: hobbiesHabits, // Pass the list of hobbies habits
                            updateNewHabits: updateHobbiesNewHabits,
                          ),
                        ),
                      );
                    },
                    child: const Text('Hobbies Habits', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF45A29E), // Button color
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
