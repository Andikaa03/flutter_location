
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_tutorial/components/location.service.dart';
import 'package:flutter_tutorial/components/user_location.dart';
import 'package:latlong2/latlong.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});
  

  @override
  LocationPageState createState() => LocationPageState();
}

class LocationPageState extends State<LocationPage> {
  LocationService locationService = LocationService();

  @override
  void dispose() {
    locationService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location Page'),
      ),
      body: StreamBuilder<UserLocation>(
        stream: locationService.locationStream,
        builder: (_, AsyncSnapshot<UserLocation> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return FlutterMap(
              options: MapOptions(
                initialCenter: LatLng(snapshot.data!.latitude, snapshot.data!.longitude),
                initialZoom: 19,
                interactionOptions: const InteractionOptions(flags: InteractiveFlag.all),
              ),
              children: [
                openStreetMapTileLayer,
                 MarkerLayer(markers: [
                  Marker(point: LatLng(snapshot.data!.latitude, snapshot.data!.longitude),
                   child: const  Icon(
                    Icons.circle,
                    size:30,
                    color: Colors.blueAccent,
                   ))
                ]),
              ],
            );
          } else {
            return const Center(
              child: Text('Tidak ada data lokasi yang tersedia.'),
            );
          }
        },
      ),
    );
  }
}

TileLayer get openStreetMapTileLayer => TileLayer(
         urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c'],
);
