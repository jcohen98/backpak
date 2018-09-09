import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../drawer.dart';

class MapScreen extends StatefulWidget {
  @override
 State<StatefulWidget> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController mapController;
  final size = MediaQueryData.fromWindow(ui.window).size;
  static const LatLng location = LatLng(39.9509, -75.1930);

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Find my Pak',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 30.0)),
      ),
      drawer: MyDrawer(),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Center(
              child: SizedBox(
                width: size.width,
                height: size.height - 160,
                child: GoogleMap(
                  onMapCreated: _onMapCreated,
                ),
              ),
            ),
            RaisedButton(
              child: const Text('Go to my Pak'),
              onPressed: mapController == null
                  ? null
                  : () {
                      mapController.animateCamera(
                        CameraUpdate.newCameraPosition(
                          const CameraPosition(
                            bearing: 0.0,
                            target: location,
                            tilt: 30.0,
                            zoom: 17.0,
                          ),
                        ),
                      );
                      mapController.addMarker(
                        MarkerOptions(
                          position: location,
                        ),
                      );
                    },
            ),
          ],
        ),
      ),
    );
  }
}
