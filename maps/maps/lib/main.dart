import 'package:flutter/material.dart';
import 'package:maps/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF000A1F),
          titleTextStyle: TextStyle(color: Colors.white,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        )
      ),
      ),
      home: const HomeScreen(),
    );
  }
}

