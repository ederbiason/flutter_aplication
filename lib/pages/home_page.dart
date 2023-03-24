import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: Icon(Icons.logout),
          )
        ],
        title: Text("Maps"),
      ),
      body: Center(
          child: FlutterMap(
            options: MapOptions(
              center: LatLng(-23.31954553676329, -51.1712561635146),
              zoom: 12.5,
            ),
            nonRotatedChildren: [
              AttributionWidget.defaultWidget(
                source: 'OpenStreetMap contributors',
                onSourceTapped: null,
              ),
            ],
            children: [
              TileLayer(
                
                urlTemplate: 'https://stamen-tiles.a.ssl.fastly.net/terrain/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
            ],
        )
      ),
    );
  }
}
