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
  static const CameraPosition _cameraPosition = CameraPosition(target: LatLng(1, 1),
  zoom: 8);

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 400,
          child: GoogleMap(
            onMapCreated: (GoogleMapController controller){
              _controller.complete(controller);
            }, initialCameraPosition: _cameraPosition,
          ),
        )
      ],
    );
  }
}