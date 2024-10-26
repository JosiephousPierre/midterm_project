import 'package:flutter/material.dart';
import 'package:mobile_app/habit.dart';

class HobbieScreen extends StatefulWidget {
  final List<Habit> habits; // Updated to receive a list of habits
  final Function(List<Habit>) updateNewHabits;

  HobbieScreen({
    Key? key,
    required this.habits,
    required this.updateNewHabits,
  }) : super(key: key);

  @override
  _HobbieScreenState createState() => _HobbieScreenState();
}

class _HobbieScreenState extends State<HobbieScreen> {
  TextEditingController newHabitController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hobbies Habits', style: TextStyle(color: Colors.white)),
      backgroundColor: Color(0xFF0B0C10),
      iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.habits.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(widget.habits[index].name, style: TextStyle(color: Color(0xFFC5C6C7))),
                  leading: Checkbox(
                    activeColor: Colors.green,
                    value: widget.habits[index].completed,
                    onChanged: (newValue) {
                      setState(() {
                        widget.habits[index].completed = newValue!;
                      });
                      widget.updateNewHabits(widget.habits); // Update the parent
                    },
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit, color: Color(0xFF45A29E)),
                        onPressed: () {
                          _editHabit(context, index); // Call edit functionality
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Color(0xFF45A29E)),
                        onPressed: () {
                          setState(() {
                            widget.habits.removeAt(index); // Remove habit
                          });
                          widget.updateNewHabits(widget.habits); // Update after deletion
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: TextStyle(color: Color(0xFFC5C6C7)),
              controller: newHabitController,
              decoration: InputDecoration(
                hintText: "Enter new hobby habit",
                hintStyle: TextStyle(color: Color(0xFFC5C6C7)),
                suffixIcon: IconButton(
                  icon: Icon(Icons.add, color: Color(0xFF45A29E)),
                  onPressed: () {
                    if (newHabitController.text.isNotEmpty) {
                      setState(() {
                        widget.habits.add(Habit(name: newHabitController.text));
                        newHabitController.clear(); // Clear the input field
                        widget.updateNewHabits(widget.habits); // Pass the updated habits back
                      });
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Method to edit habit
  void _editHabit(BuildContext context, int index) {
    TextEditingController editController = TextEditingController();
    editController.text = widget.habits[index].name; // Pre-fill the current habit name

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Hobby'),
          content: TextField(
            controller: editController,
            decoration: InputDecoration(hintText: "Edit hobby"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  widget.habits[index].name = editController.text; // Update the habit name
                });
                widget.updateNewHabits(widget.habits); // Update the state
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog without saving
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
