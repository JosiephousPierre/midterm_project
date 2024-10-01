import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HealthScreen extends HookWidget {
    @override
    Widget build(BuildContext context){
        var pushUpCompleted = useState(false);
        var squatCompleted = useState(false);


        return Scaffold(
        appBar: AppBar(
            title: Text('Health Habits')
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                CheckboxListTile(
                    title: Text('Exercise'),
                    value: pushUpCompleted.value,
                    onChanged: (newValue) {
                        pushUpCompleted.value = newValue!;
                    },
                ),
                CheckboxListTile(
                    title: Text('Exercise'),
                    value: squatCompleted.value,
                    onChanged: (newValue) {
                        squatCompleted.value = newValue!;
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