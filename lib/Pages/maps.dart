import 'package:flutter/material.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Map',
          ),
          backgroundColor: Color(0xfff409c74)),
      body: OpenStreetMapSearchAndPick(
          center: LatLong(23, 89),
          buttonColor: Color(0xfffff3939),
          
          buttonText: 'Set Current Location',
          onPicked: (pickedData) {
            print(pickedData.latLong.latitude);
            print(pickedData.latLong.longitude);
            print(pickedData.address);
          }),
    );
  }
}
