import 'package:flutter/material.dart';
import 'package:fuentes_de_agua/home_screen.dart';
import 'package:fuentes_de_agua/services/font_service.dart';
import 'package:provider/provider.dart';

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
      home: Provider<FontService>(
        create: (BuildContext context) => FontService.create(),
        dispose: (_, FontService service) => service.client.dispose(),
        child: const HomeScreen(),
      ),
    );
  }
}
