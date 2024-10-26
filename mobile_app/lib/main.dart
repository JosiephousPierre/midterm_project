import 'package:flutter/material.dart';
import 'package:mobile_app/screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habit Tracker',
      theme: ThemeData(
        primaryColor: Color(0xFF0B0C10), // AppBar color
        scaffoldBackgroundColor: Color(0xFF1F2833), // Background color
        iconTheme: IconThemeData(color: Colors.white), // Change back button color here
      ),
      home: HomeScreen(),
    );
  }
}
