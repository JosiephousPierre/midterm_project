import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HobbieScreen extends HookWidget {
    @override
    Widget build(BuildContext context){
        var tennisCompleted = useState(false);
        var joggingCompleted = useState(false);
        var cookingCompleted = useState(false);


        return Scaffold(
        appBar: AppBar(
            title: Text('Hobbies Habits')
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                CheckboxListTile(
                    title: Text('Playing Tennis'),
                    value: tennisCompleted.value,
                    onChanged: (newValue) {
                        tennisCompleted.value = newValue!;
                    },
                ),
                CheckboxListTile(
                    title: Text('Jogging'),
                    value: joggingCompleted.value,
                    onChanged: (newValue) {
                        joggingCompleted.value = newValue!;
                    },
                ),
                CheckboxListTile(
                    title: Text('Cooking'),
                    value: cookingCompleted.value,
                    onChanged: (newValue) {
                        cookingCompleted.value = newValue!;
                    },
                ),
                ElevatedButton(
                    onPressed: () {
                        Navigator.pop(context);
                    },
                    child: Text('Back to Home'),
                )
            ]
        ),
        );
    }
}