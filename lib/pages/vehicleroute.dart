import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../base/BaseData.dart';
import '../base/functions.dart';

class VehicleRoute extends StatefulWidget {
  const VehicleRoute({super.key});


  @override
  State<VehicleRoute> createState() => _VehicleRouteState();
}



class _VehicleRouteState extends State<VehicleRoute> {

  MyFunctions functions = MyFunctions();
  late Timer timer;
  BaseData baseData = BaseData();

  Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(0.569525, 34.558376),
    zoom: 14.4746,
  );

  sendCoordinatesTimer(double lat, double long) async {
    timer = Timer.periodic(const Duration(seconds: 30), (timer) {
      functions.sendCoordinates(lat, long);
    });
  }
  initPolyline() {
    debugPrint("Reached Polyline");
    for(int i=0; i<latLen.length; i++){
      _markers.add(
        // added markers
          Marker(
            markerId: MarkerId(i.toString()),
            position: latLen[i],
            infoWindow: InfoWindow(
              title: 'HOTEL',
              snippet: '5 Star Hotel',
            ),
            icon: BitmapDescriptor.defaultMarker,
          )
      );
      setState(() {

      });
      _polyline.add(
          Polyline(
            polylineId: PolylineId('1'),
            points: latLen,
            color: Colors.black,
            width: 5,
          )
      );
    }
  }

  List<LatLng> latLen = [
    LatLng(0.569525, 34.558376),
    LatLng(0.2827, 34.7519),
    LatLng(0.5143, 35.2698),
  ];

  final Set<Marker> _markers = {};
  final Set<Polyline> _polyline = {};

  @override
  void initState() {
    initPolyline();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        // title of app
        title: Text("Destination Route"),
      ),
      body: Container(
        child: SafeArea(
          child: GoogleMap(
            //given camera position
            initialCameraPosition: _kGooglePlex,
            // on below line we have given map type
            mapType: MapType.normal,
            // specified set of markers below
            markers: _markers,
            // on below line we have enabled location
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            // on below line we have enabled compass location
            compassEnabled: true,
            // on below line we have added polylines
            polylines: _polyline,
            // displayed google map
            onMapCreated: (GoogleMapController controller){
              _controller.complete(controller);
            },
          ),
        ),
      ),
    );
  }
}
