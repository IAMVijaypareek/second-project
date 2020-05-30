import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  /* LatLngBounds _visibleRegion = LatLngBounds(
    southwest: const LatLng(0, 0),
    northeast: const LatLng(0, 0),
  );*/

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(19.281256, -73.048294),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    print("Map Builder");

    return new Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            minMaxZoomPreference: MinMaxZoomPreference.unbounded,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            onTap: (latlng) async {
              print(latlng);
            },
            compassEnabled: true,
            zoomControlsEnabled: true,
            mapType: MapType.hybrid,
            myLocationButtonEnabled: true,
            //mapToolbarEnabled: true,

            myLocationEnabled: true,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;

    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
