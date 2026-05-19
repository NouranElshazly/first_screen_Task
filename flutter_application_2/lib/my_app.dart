import 'package:flutter/material.dart';
import 'package:flutter_application_2/my_first_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyFirstScreen());
  }
}
