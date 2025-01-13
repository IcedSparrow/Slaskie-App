import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatelessWidget {
  // Lista przykładowych zabytków techniki z ich lokalizacjami
  final List<Map<String, dynamic>> landmarks = [
    {
      'name': 'Sztolnia Królowa Luiza',
      'street': 'ul. Wolności 375',
      'postalCode': '41-800',
      'image': 'assets/sztolnia_luiza.jpg',
      'lat': 50.2573,
      'lng': 18.9848,
    },
    {
      'name': 'Kopalnia Guido',
      'street': 'ul. Bohaterów Getta Warszawskiego 1',
      'postalCode': '41-800',
      'image': 'assets/guido.jpg',
      'lat': 50.2934,
      'lng': 18.8602,
    },
    {
      'name': 'Muzeum Śląskie',
      'street': 'ul. T. Dobrowolskiego 1',
      'postalCode': '40-205',
      'image': 'assets/muzeum_slaskie.jpg',
      'lat': 50.2556,
      'lng': 19.0263,
    },
    // Dodaj więcej zabytków według potrzeb
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Szlak Zabytków Techniki'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Sprawdzamy, czy ekran jest w orientacji poziomej
          bool isLandscape = constraints.maxWidth > constraints.maxHeight;

          return SingleChildScrollView(
            child: isLandscape
                ? Row(
                    children: [
                      // Mapa w lewym panelu
                      Container(
                        width: constraints.maxWidth * 0.5,
                        height: constraints.maxHeight,
                        child: FlutterMap(
                          options: MapOptions(
                            initialCenter: LatLng(50.2655, 19.0294), // Centrum Katowic
                            initialZoom: 13.0,
                            maxZoom: 18.0,
                            minZoom: 10.0,
                          ),
                          children: [
                            TileLayer(
                              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                            ),
                            MarkerLayer(
                              markers: landmarks.map((landmark) {
                                return Marker(
                                  point: LatLng(landmark['lat'], landmark['lng']),
                                  width: 80,
                                  height: 80,
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Icon(Icons.location_on, color: Colors.red, size: 40.0),
                                        Text(
                                          landmark['name'],
                                          style: TextStyle(color: Colors.black, fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      // Lista zabytków w prawym panelu
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Lista Zabytków',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: landmarks.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    leading: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8.0), // Lekko zaokrąglony kwadrat
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(landmarks[index]['image']),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    title: Text(landmarks[index]['name']),
                                    subtitle: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(landmarks[index]['street']),
                                        Text(landmarks[index]['postalCode']),
                                      ],
                                    ),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.add, color: Colors.blue, size: 16), // Zmieniony kolor na niebieski
                                      ],
                                    ),
                                    onTap: () {
                                      // Przejście do szczegółów zabytku lub inna akcja
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      // Mapa
                      Container(
                        height: constraints.maxHeight * 0.6, // Ustaw wysokość mapy, np. 60% wysokości ekranu
                        child: FlutterMap(
                          options: MapOptions(
                            initialCenter: LatLng(50.2655, 19.0294), // Centrum Katowic
                            initialZoom: 13.0,
                            maxZoom: 18.0,
                            minZoom: 10.0,
                          ),
                          children: [
                            TileLayer(
                              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                            ),
                            MarkerLayer(
                              markers: landmarks.map((landmark) {
                                return Marker(
                                  point: LatLng(landmark['lat'], landmark['lng']),
                                  width: 80,
                                  height: 80,
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Icon(Icons.location_on, color: Colors.red, size: 40.0),
                                        Text(
                                          landmark['name'],
                                          style: TextStyle(color: Colors.black, fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      // Lista zabytków
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Lista Zabytków',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: landmarks.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8.0), // Lekko zaokrąglony kwadrat
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(landmarks[index]['image']),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  title: Text(landmarks[index]['name']),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(landmarks[index]['street']),
                                      Text(landmarks[index]['postalCode']),
                                    ],
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.add, color: Colors.blue, size: 16), // Zmieniony kolor na niebieski
                                    ],
                                  ),
                                  onTap: () {
                                    // Przejście do szczegółów zabytku lub inna akcja
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
