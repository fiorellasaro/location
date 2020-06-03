import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  LatLng _latLng = LatLng(37.42796133580664, -122.085749655962);
  GoogleMapController _controller;
  Location _location = Location();
  void _onMapCreated(GoogleMapController _cntrl) {
    _controller = _cntrl;
    _location.onLocationChanged.listen((l) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude, l.longitude), zoom: 15),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Text("hola"),
          GoogleMap(
            initialCameraPosition: CameraPosition(target: _latLng, zoom: 10),
            mapType: MapType.normal,
            onMapCreated: _onMapCreated,
            myLocationEnabled: true,
            zoomControlsEnabled: true,
          )
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
