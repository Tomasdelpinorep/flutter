import 'package:flutter/material.dart';
import 'package:maps/items/map_marker_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Maps #1"),
        centerTitle: true,
      ),
      body: ListView(
        children: const [
          MapMarkerItem(),
        ],
      ),
    );
  }
}