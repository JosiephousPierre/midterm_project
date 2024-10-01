import 'package:flutter/material.dart';
import 'package:mobile_app/screen/health_screen.dart';
import 'package:mobile_app/screen/hobbies_screen.dart';
import 'package:mobile_app/screen/social_sceen.dart';
import 'package:mobile_app/screen/summary_screen.dart';

class HomeScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context){
        return Scaffold(
        appBar: AppBar(
            title: Text('Habit Tracker')
        ),
        body: Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                ElevatedButton(
                onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HealthScreen()),
                    );
                },
                child: Text('Health Habits'),
                ),
                ElevatedButton(
                onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HobbieScreen()),
                    );
                },
                child: Text('Hobbies Habits'),
                ),
                ElevatedButton(
                onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SocialScreen()),
                    );
                },
                child: Text('Social Habits'),
                ),
                ElevatedButton(
                onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SummaryScreen()),
                    );
                },
                child: Text('View Summary'),
                ),
            ]
            ),
        ),
        );
    }
}