import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/todo/todo_bloc.dart';
import 'presentation/home/screen_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maktub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
        appBarTheme: const AppBarTheme(
          shadowColor: Colors.grey,
          elevation: 0.5,
          titleTextStyle: TextStyle(
            fontSize: 23,
            letterSpacing: 1,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        checkboxTheme: const CheckboxThemeData(
          fillColor: WidgetStatePropertyAll(Colors.white),
          checkColor: WidgetStatePropertyAll(Colors.black),
        ),
      ),
      home: BlocProvider(
        create: (context) => TodoBloc(),
        child: const ScreenHome(),
      ),
    );
  }
}
