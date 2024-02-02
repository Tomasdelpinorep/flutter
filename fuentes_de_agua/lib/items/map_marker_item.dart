import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fuentes_de_agua/models/font_response/geo_point2d.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapMarkerItem extends StatefulWidget {
  const MapMarkerItem({super.key, required this.markerList});
  final List<GeoPoint2d> markerList;

  @override
  State<MapMarkerItem> createState() => _MapMarkerItemState();
}

class _MapMarkerItemState extends State<MapMarkerItem> {
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _cameraPosition =
      CameraPosition(target: LatLng(1, 1), zoom: 8);

  geoPointsToMarkers() {
    Set<Marker> usableMarkers = {};
    int i = 0;
    for (var geo_point2d in widget.markerList) {
      usableMarkers.add(Marker(
          markerId: MarkerId('$i'),
          position: LatLng(geo_point2d.lat!, geo_point2d.lon!)));

      i++;
    }
    return usableMarkers;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 400,
          child: GoogleMap(
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            initialCameraPosition: _cameraPosition,
            markers: geoPointsToMarkers(),
          ),
        )
      ],
    );
  }
}
