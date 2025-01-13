import 'package:flutter/material.dart';
import 'trail_details_mapa_screen.dart';
import 'trail_info_screen.dart';

class TrailDetailsScreen extends StatelessWidget {
  final String trailName;

  const TrailDetailsScreen({Key? key, required this.trailName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sprawdzamy orientację ekranu
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text(
          trailName,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.blue),
            onPressed: () {
              // Akcja dla "Ulubione"
            },
          ),
          IconButton(
            icon: Icon(Icons.search, color: Colors.blue),
            onPressed: () {
              // Akcja dla "Szukaj"
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Dodajemy sekcję "Lista" i "Mapy"
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {},
                child: Text('Lista', style: TextStyle(color: Colors.black)),
              ),
              TextButton(
                onPressed: () {
                  // Przejście do ekranu z mapą
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TrailDetailsMapaScreen()),
                  );
                },
                child: Text('Mapy', style: TextStyle(color: const Color.fromARGB(255, 174, 177, 177))),
              ),
            ],
          ),
          // Grid dla obiektów z sekcją "O szlaku" na początku
          GridView.count(
            crossAxisCount: isLandscape ? 4 : 2, // Zmienia liczbę kolumn w zależności od orientacji
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              // Sekcja "O szlaku"
              Card(
                margin: const EdgeInsets.all(8.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                color: Colors.teal,
                child: InkWell(
                  onTap: () {
                    // Nawigacja do nowego ekranu z informacjami o szlaku
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TrailInfoScreen(trailName: trailName)),
                    );
                  },
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'O szlaku',
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              // Lista obiektów
              _buildObjectCard(
                title: 'Muzeum Hutnictwa',
                location: 'CHORZÓW',
                visitTime: 'Czas zwiedzania: 1 h',
                imageUrl: 'assets/muzeum_hutnictwa.jpg',
              ),
              _buildObjectCard(
                title: 'Stara Fabryka',
                location: 'BIELSKO-BIAŁA',
                visitTime: 'Czas zwiedzania: 1.5 h',
                imageUrl: 'assets/stara_fabryka.jpg',
              ),
              _buildObjectCard(
                title: 'Szyb Prezydent, Kompleks...',
                location: 'BYTOM',
                visitTime: 'Czas zwiedzania: 1.5 h',
                imageUrl: 'assets/szyb_prezydent.jpg',
              ),
              _buildObjectCard(
                title: 'Górnośląskie Koleje Wąskotorowe',
                location: 'BYTOM',
                visitTime: 'Czas zwiedzania: 1.5 h',
                imageUrl: 'assets/koleje_waskotorowe.jpg',
              ),
              _buildObjectCard(
                title: 'Browar Zamkowy',
                location: 'CIESZYN',
                visitTime: 'Czas zwiedzania: 1.5 h',
                imageUrl: 'assets/browar_zamkowy.jpg',
              ),
              _buildObjectCard(
                title: 'Muzeum Drukarstwa',
                location: 'CIESZYN',
                visitTime: 'Czas zwiedzania: 0.75 h',
                imageUrl: 'assets/muzeum_drukarstwa.jpg',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildObjectCard({
    required String title,
    required String location,
    required String visitTime,
    required String imageUrl,
  }) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
                  child: Image.asset(imageUrl, fit: BoxFit.cover, width: double.infinity),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    icon: Icon(Icons.favorite_border, color: Colors.white),
                    onPressed: () {
                      // Akcja dla "Ulubione"
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.grey, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      location,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  visitTime,
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
