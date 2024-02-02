import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:fuentes_de_agua/items/map_marker_item.dart';
import 'package:fuentes_de_agua/models/font_response/font_response.dart';
import 'package:fuentes_de_agua/models/font_response/geo_point2d.dart';
import 'package:fuentes_de_agua/models/font_response/result.dart';
import 'package:provider/provider.dart';
import 'services/font_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Response response;
  List<Result> fonts = [];
  List<GeoPoint2d> markerList = [];

  @override
  void initState() {
    super.initState();
    Provider.of<FontService>(context, listen: false)
        .fetchValenciasFontResponse()
        .then((value) {
      setState(() {
        response = value;
        fonts = FontResponse.fromJson(response.body!).results!;
        for (var element in fonts) {
          markerList.add(element.geoPoint2d!);
        }
      });
    }).onError((error, stackTrace) {
      print('my error: ' + error.toString());
      print('mytrack: ' + stackTrace.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fuentes en Valencia"),
        centerTitle: true,
      ),
      body: ListView(
        shrinkWrap: false,
        children: [
          const Text(
            'Where Are the Main Fountains in Valencia?',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          markerList.isEmpty
              ? const CircularProgressIndicator()
              : MapMarkerItem(markerList: markerList)
        ],
      ),
    );
  }
}
