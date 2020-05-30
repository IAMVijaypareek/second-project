import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobilerecharge/providers/location_provider/loc_provider.dart';
import 'package:provider/provider.dart';

class GeoPage extends StatefulWidget {
  @override
  _GeoPageState createState() => _GeoPageState();
}

class _GeoPageState extends State<GeoPage> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  int index = 0;
  //Position _currentPosition;
  // String _currentAddress;
  @override
  void initState() {
    super.initState();

    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseUser user1 = Provider.of<FirebaseUser>(context);
    if (user1 == null)
      return Text("loading...");
    else
      return Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              /*if (_currentPosition == null)
              Row(
                children: <Widget>[
                  FlatButton(
                      onPressed: () {
                       // _getPermissionStatus();
                        _getCurrentLocation();
                        /* showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Location'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Allow Beckup Bull to access device Location'),
              Text('Would you like to approve of this message?'),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  ); */
                      },
                      child: Icon(Icons.location_on)),
                  Text(_currentAddress ?? "location"),
                ],
              ), */
              // if (_currentPosition != null)
              FlatButton(
                  onPressed: () {},
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        size: 30.0,
                      ),
                      Container(
                        child: Consumer<LocationProvide>(
                              builder: (context, data, child) {
                                // print(data.getcurrentAddress);
                                // _currentAddress = data.getcurrentAddress.toString();
                                return Flexible(
                                  child: GestureDetector(
                                    onTap: () {
                                      Firestore.instance
                                          .collection('Location')
                                          .document(user1.uid)
                                          .setData({
                                        'Address':
                                            data.getcurrentAddress.toString(),
                                        'author': 'author'
                                      });
                                    },
                                    child: Text(
                                      data.getcurrentAddress.toString() ??
                                          "loading",
                                      style: TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueGrey),
                                    ),
                                  ),
                                );
                              },
                            ) ??
                            Text("loaing..."),
                      )
                    ],
                  )),
            ],
          ),
        ),
      );
  }

  /* _getPermissionStatus() async {
    // Geolocator geolocator = Geolocator()..forceAndroidLocationManager = true;
    GeolocationStatus geolocationStatus =
        await geolocator.checkGeolocationPermissionStatus();

    print(geolocationStatus);
  }
 */
  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      if (mounted) {
        // _currentPosition = position;
        LocationProvide locprovide =
            Provider.of<LocationProvide>(context, listen: false);
        locprovide.setAddressFromLatLng(position);

        /* setState(() {
          _currentPosition = position;
          LocationProvide locprovide =
              Provider.of<LocationProvide>(context, listen: false);
          locprovide.setAddressFromLatLng(_currentPosition);
        });*/
      }

      /* Consumer<LocationProvide>(
        builder: (context, data, child) {
          print(data.getcurrentAddress);
          _currentAddress = data.getcurrentAddress.toString();
          return ;
        },
      );  */

      // _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }
/*
  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
            "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }*/
}
