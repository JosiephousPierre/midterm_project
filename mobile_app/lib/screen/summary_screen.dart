import 'package:flutter/material.dart';

class SummaryScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context){
        return Scaffold(
        appBar: AppBar(
            title: Text('Summary')
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Text('This is where my habit summary will be displayed'),
                    ElevatedButton(
                        onPressed: () {
                            Navigator.pop(context);
                        },
                        child: Text('Back to Home'),
                    ),
                ],
            ),
        ),
        );
    }
}