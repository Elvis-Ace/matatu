import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:matatu/base/BaseData.dart';
import 'package:matatu/widgets/mytext.dart';

import '../base/functions.dart';
class HomeView extends StatefulWidget {
  String route,name;
  HomeView({required this.route,required this.name,super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  MyFunctions functions = MyFunctions();
  late Timer timer;
  List<dynamic> vehicles = [];
  BaseData baseData = BaseData();
  Set<Marker> markers = Set();

  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  getLocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    double lat = position.latitude;
    double long = position.longitude;

    LatLng location = LatLng(lat, long);

    CameraPosition _kLake = CameraPosition(
        bearing: 192.8334901395799,
        target: location,
        tilt: 59.440717697143555,
        zoom: 19.151926040649414);


    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));

  }
  
  fetchvehicles()async{
    EasyLoading.show(status: "Fetching Vehicles in ${widget.name} Route");
    var data = await baseData.getData('incoming/${widget.route}');
    if(data['success'] == true){
      debugPrint(data['data'].toString());
      for(int i = 0;i<data['data'].length;i++){
        Marker resultMarker = Marker(
          markerId: MarkerId(data['data'][i]['vehicle']['id'].toString()),
          infoWindow: InfoWindow(
              title: data['data'][i]['vehicle']['name'],
              snippet: data['data'][i]['route']['name']),
          position: LatLng(
              data['data'][i]['coordinates'].first['latitude'],
              data['data'][i]['coordinates'].first['longitude']
          ),
        );
        markers.add(resultMarker);
      }
    }
    EasyLoading.dismiss();
    getLocation();
    setState(() {

    });
  }
  
  @override
  void initState() {
    // TODO: implement initState
    fetchvehicles();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: MyTextView(data: widget.name,),),
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: markers,
      ),

    );
  }
}
