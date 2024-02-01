import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapMarkerItem extends StatefulWidget {
  const MapMarkerItem({super.key});

  @override
  State<MapMarkerItem> createState() => _MapMarkerItemState();
}

class _MapMarkerItemState extends State<MapMarkerItem> {
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _cameraPosition = CameraPosition(
    target: LatLng(37.3803629, 151.1947171),
    zoom: 12,
  );

  @override
  Widget build(BuildContext context) {

    var markers = {const Marker(markerId: MarkerId('1'),
    position: LatLng(37.38046097655179, -6.007620589625113))};


    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: 400,
          child: GoogleMap(
            onMapCreated: (GoogleMapController controller){
              _controller.complete(controller);
            },
            initialCameraPosition: _cameraPosition,
            markers: markers,
          ),
        ),
      ],
    );
  }
}