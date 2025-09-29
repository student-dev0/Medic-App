// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class DirectionMap extends StatefulWidget {
//   final double width;
//   final double height;
//   final List<LatLng> customLocations;
//   final List<String> titles;
//   const DirectionMap({
//     super.key,
//     this.width = 400,
//     this.height = 400,
//     this.customLocations = const [],
//     this.titles = const [],
//   });

//   @override
//   State<DirectionMap> createState() => _DirectionMapState();
// }

// class _DirectionMapState extends State<DirectionMap> {
//   late GoogleMapController _mapController;
//   LatLng? _currentPosition;
//   bool _isLoading = true;
//   final Set<Marker> _markers = {};

//   Future<void> _getUserLocation() async {
//     LocationPermission permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied ||
//         permission == LocationPermission.deniedForever) {
//       permission = await Geolocator.requestPermission();
//     }

//     try {
//       final locationSettings = const LocationSettings(
//         accuracy: LocationAccuracy.bestForNavigation,
//         // optional: you can also set a distance filter or time limit
//         distanceFilter: 0,
//         // timeLimit: Duration(seconds: 5), // if needed
//       );

//       Position position = await Geolocator.getCurrentPosition(
//         locationSettings: locationSettings,
//       );

//       setState(() {
//         _isLoading = false;
//         _currentPosition = LatLng(position.latitude, position.longitude);

//         //Add custom markers from list
//         _addMarkers();

//         _markers.add(
//           Marker(
//             markerId: const MarkerId('currentLocation'),
//             position: _currentPosition!,
//             infoWindow: const InfoWindow(title: 'Your Location'),
//             icon: BitmapDescriptor.defaultMarkerWithHue(
//               BitmapDescriptor.hueAzure,
//             ),
//           ),
//         );
//       });
//       _mapController.animateCamera(
//         CameraUpdate.newCameraPosition(
//           CameraPosition(target: _currentPosition!, zoom: 14),
//         ),
//       );
//     } catch (e) {
//       print("Error getting location: $e");
//       // Handle the error appropriately, e.g., show an error message.
//       // You might want to set a default location here as well.
//     }
//   }

//   void _addMarkers() {
//     for (int i = 0; i < widget.customLocations.length; i++) {
//       _markers.add(createMarker(i));
//     }
//   }

//   void _onMapCreated(GoogleMapController controller) {
//     _mapController = controller;
//     _getUserLocation(); // get location once map is created
//   }

//   Marker createMarker(int i) {
//     return Marker(
//       markerId: MarkerId("custom_$i"),
//       position: widget.customLocations[i],
//       infoWindow: InfoWindow(
//         title: i < widget.titles.length ? widget.titles[i] : "Place ${i + 1}",
//       ),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: widget.height,
//       width: widget.width,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Colors.grey.shade400),
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(12),
//         child: _isLoading
//             ? const Center(child: CircularProgressIndicator())
//             : GoogleMap(
//                 onMapCreated: _onMapCreated,
//                 initialCameraPosition: CameraPosition(
//                   target: _currentPosition!,
//                   zoom: 14,
//                 ),
//                 markers: _markers,
//                 myLocationEnabled: true, // blue dot
//                 myLocationButtonEnabled: true, // location button
//               ),
//       ),
//     );
//   }
// }
