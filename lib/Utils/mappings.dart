import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mapping extends StatefulWidget {
  const Mapping({super.key});

  @override
  State<Mapping> createState() => _MappingState();
}

class _MappingState extends State<Mapping> {
  GoogleMapController? mapController;
  Set<Marker> markers = {};

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;

    // how to add markers
    setState(() {
      markers.add(
        Marker(
          markerId: MarkerId('marker_1'),
          position: LatLng(37.7749, -122.4194),
          infoWindow: InfoWindow(title: 'San Francisco'),
        ),
      );
        markers.add(
        Marker(
          markerId: MarkerId('marker_2'),
          position: LatLng(35.7749, -121.4194),
          infoWindow: InfoWindow(title: 'Marker 2'),
        ),
      );
        markers.add(
        Marker(
          markerId: MarkerId('marker_3'),
          position: LatLng(36.7749, -125.4194),
          infoWindow: InfoWindow(title: 'Marker 3'),
        ),
      );
    }); 
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: GoogleMap(
          onMapCreated: _onMapCreated,
          markers: markers,
          initialCameraPosition: CameraPosition(
            target: LatLng(37.7749, -122.4194), // San Francisco coordinates
            zoom: 12,
          ),

          // myLocationEnabled: true, // blue dot
          // myLocationButtonEnabled: true, //  location button
        ),
      ),
    );
  }
}
