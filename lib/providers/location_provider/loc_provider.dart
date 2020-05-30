import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationProvide extends ChangeNotifier {
  String _currentAddress;
  String get getcurrentAddress => _currentAddress;

  setAddressFromLatLng(_currentPosition) async {
    try {
      List<Placemark> p = await Geolocator().placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];
      _currentAddress = "${place.subLocality},\n ${place.postalCode}";
    } catch (e) {
      print(e);
    }

    notifyListeners();
  }
}
