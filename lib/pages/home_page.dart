import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  final searchController = TextEditingController();

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0E1429),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: Icon(Icons.logout),
          )
        ],
        title: Icon(Icons.menu),
        backgroundColor: Color.fromARGB(255, 9, 13, 27),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Image.asset('lib/assets/images/logoImage.png'),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
                  margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                  decoration: BoxDecoration(
                      color: Color(0xFF2C3556),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        size: 40,
                        color: Color(0xFF44495F),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextField(
                            decoration: InputDecoration(
                          hintText: 'Pesquisar...',
                          hintStyle:
                              TextStyle(fontSize: 20, color: Color(0xFF44495F)),
                          border: InputBorder.none,
                        )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    height: 250,
                    decoration: BoxDecoration(
                        color: Color(0xFF1A254E),
                        borderRadius: BorderRadius.circular(10)),
                    child: FlutterMap(
                      options: MapOptions(
                        center: LatLng(-23.31954553676329, -51.1712561635146),
                        zoom: 13,
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              'https://stamen-tiles.a.ssl.fastly.net/terrain/{z}/{x}/{y}.png',
                          userAgentPackageName: 'com.example.app',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
