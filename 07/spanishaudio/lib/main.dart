import 'package:flutter/material.dart';
import 'package:spanishaudio/HomePage.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.teal),
      title: "Learn Spanish Numbers",
    );
  }
}
