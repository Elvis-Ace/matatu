import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../base/functions.dart';

class MatatuView extends StatefulWidget {
  const MatatuView({super.key});

  @override
  State<MatatuView> createState() => _MatatuViewState();
}

class _MatatuViewState extends State<MatatuView> {
  MyFunctions functions = MyFunctions();
  late Timer timer;

  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  sendCoordinatesTimer(double lat, double long) async {
    timer = Timer.periodic(const Duration(seconds: 30), (timer) {
      functions.sendCoordinates(lat, long);
    });
  }

  getLocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    double lat = position.latitude;
    double long = position.longitude;

    sendCoordinatesTimer(lat, long);
    LatLng location = LatLng(lat, long);

    CameraPosition _kLake = CameraPosition(
        bearing: 192.8334901395799,
        target: location,
        tilt: 59.440717697143555,
        zoom: 19.151926040649414);


    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));

  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
