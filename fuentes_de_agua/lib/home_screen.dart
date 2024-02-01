import 'package:flutter/material.dart';
import 'package:fuentes_de_agua/items/map_marker_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Maps #2"),
        centerTitle: true,
      ),
      body: Column(
        children: [MapMarkerItem()]),
    );
  }
}
