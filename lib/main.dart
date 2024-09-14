import 'package:flutter/material.dart';

import 'presentation/home/screen_home.dart';

void main() {
  runApp(const MyApp());
}

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.lightGreen,
  scaffoldBackgroundColor: Colors.white,
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: Colors.black),
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maktub',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: const ScreenHome(),
    );
  }
}
