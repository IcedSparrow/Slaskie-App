import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class FavoriteTrailsScreen extends StatelessWidget {
  final Set<String> favoriteTrails;

  const FavoriteTrailsScreen({Key? key, required this.favoriteTrails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Coordinates for 'Stara Fabryka' in Bielsko-Biała
    final LatLng staraFabrykaLocation = LatLng(49.8225, 19.0522); // Adjust these coordinates as needed

    // Detect screen orientation (portrait or landscape)
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Ulubione Szlaki',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.blue),
            onPressed: () {},
          ),
        ],
      ),
      body: isLandscape
          // Landscape Mode
          ? Row(
              children: [
                // Map view on the left side in landscape mode
                Expanded(
                  flex: 2,
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
                        markers: [
                          Marker(
                            point: staraFabrykaLocation,
                            width: 80,
                            height: 80,
                            child: Column(
                              children: [
                                // Use a red icon instead of blue
                                Icon(Icons.location_on, color: Colors.red, size: 50),
                                Text(
                                  'Stara Fabryka',
                                  style: TextStyle(color: Colors.black, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Details on the right side in landscape mode
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.all(16.0),
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10.0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Stara Fabryka',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Adres: pl. Żwirki i Wigury 8, Bielsko-Biała',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'e-mail: sekretariat@muzeum.bielsko.pl',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'www: muzeum.bielsko.pl',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Telefon: 33 812 23 67',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 16.0),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                            ),
                            child: Text('Nawiguj', style: TextStyle(fontSize: 18)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          // Portrait Mode
          : Column(
              children: [
                // Top section with trail information
                Container(
                  padding: EdgeInsets.all(16.0),
                  color: Colors.grey[200],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Stara Fabryka',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Bielsko-Biała, Plac Żwirki i Wigury 8',
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                // Search bar
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10.0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Szukaj',
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.search, color: Colors.blue),
                          onPressed: () {},
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                      ),
                    ),
                  ),
                ),
                // Map view
                Expanded(
                  child: Stack(
                    children: [
                      FlutterMap(
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
                            markers: [
                              Marker(
                                point: staraFabrykaLocation,
                                width: 80,
                                height: 80,
                                child: Column(
                                  children: [
                                    // Use a red icon instead of blue
                                    Icon(Icons.location_on, color: Colors.red, size: 50),
                                    Text(
                                      'Stara Fabryka',
                                      style: TextStyle(color: Colors.black, fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // Bottom card with details
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          margin: EdgeInsets.all(16.0),
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10.0,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Stara Fabryka',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                'Adres: pl. Żwirki i Wigury 8, Bielsko-Biała',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                'e-mail: sekretariat@muzeum.bielsko.pl',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                'www: muzeum.bielsko.pl',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                'Telefon: 33 812 23 67',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 16.0),
                              Center(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                                  ),
                                  child: Text('Nawiguj', style: TextStyle(fontSize: 18)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
