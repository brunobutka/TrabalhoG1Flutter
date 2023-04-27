import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NewClass extends StatefulWidget {
  const NewClass({super.key});

  @override
  State<NewClass> createState() => _NewClassState();
}

class _NewClassState extends State<NewClass> {
  late BitmapDescriptor customIconOrigin;
  late BitmapDescriptor customIconDestination;

  late GoogleMapController mapController;
  final LatLng _center = const LatLng(-27.888523, -52.225743);
  Marker? _origin;
  Marker? _destination;
  Polyline? _polyline;

  @override
  void initState() {
    BitmapDescriptor.fromAssetImage(const ImageConfiguration(size: Size(45, 45)),
            'assets/origin.png')
        .then((icon) {
      customIconOrigin = icon;
    });
    BitmapDescriptor.fromAssetImage(const ImageConfiguration(size: Size(45, 45)),
            'assets/destination.png')
        .then((icon) {
      customIconDestination = icon;
    });
    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Map'),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          backgroundColor: Colors.green,
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          markers: {
            if (_origin != null) _origin!,
            if (_destination != null) _destination!,
          },
          polylines: {
            if (_polyline != null) _polyline!,
          },
          onLongPress: _addMarker,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 15.0,
          ),
        ),
      ),
    );
  }

  void _addMarker(LatLng pos) {
    if (_origin == null || (_origin != null && _destination != null)) {
      setState(() {
        _origin = Marker(
          markerId: const MarkerId('origin'),
          infoWindow: const InfoWindow(title: 'Origin'),
          icon: customIconOrigin,
          position: pos,
        );
        _destination = null;
        _polyline = null;
      });
    } else {
      setState(() {
        _destination = Marker(
          markerId: const MarkerId('destination'),
          infoWindow: const InfoWindow(title: 'Destination'),
          icon: customIconDestination,
          position: pos,
        );

        final List<LatLng> polylinePoints = [
          _origin!.position,
          _destination!.position,
        ];

        _polyline = Polyline(
          polylineId: const PolylineId('polyline'),
          color: Colors.red,
          points: polylinePoints,
          width: 2
        );
      });
    }
  }
}