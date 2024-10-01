import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SocialScreen extends HookWidget {
    @override
    Widget build(BuildContext context){
        var groupStudyCompleted = useState(false);
        var familyTimeCompleted = useState(false);


        return Scaffold(
        appBar: AppBar(
            title: Text('Social Habits')
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                CheckboxListTile(
                    title: Text('Group Study'),
                    value: groupStudyCompleted.value,
                    onChanged: (newValue) {
                        groupStudyCompleted.value = newValue!;
                    },
                ),
                CheckboxListTile(
                    title: Text('Time with Family'),
                    value: familyTimeCompleted.value,
                    onChanged: (newValue) {
                        familyTimeCompleted.value = newValue!;
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