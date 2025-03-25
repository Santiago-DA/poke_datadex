import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter App',
        theme: ThemeData(primarySwatch: Colors.blue), // Default theme
        home: Container(
          child: Column(
            children: [
              Text("Something"),
              Text("data"),
            ],
          ),
        ));
  }
}
