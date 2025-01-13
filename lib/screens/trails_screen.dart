import 'package:flutter/material.dart';
import 'trail_details_screen.dart';

class TrailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sprawdzamy rozmiar ekranu i dostosowujemy układ
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Szlaki',
          style: TextStyle(color: Colors.blue, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.blue),
            onPressed: () {
              // Akcja dla przycisku "Ulubione"
            },
          ),
          IconButton(
            icon: Icon(Icons.search, color: Colors.blue),
            onPressed: () {
              // Akcja dla przycisku "Szukaj"
            },
          ),
        ],
      ),
      body: isLandscape 
        ? _buildLandscapeLayout(context) // Dostosowanie układu w orientacji poziomej
        : _buildPortraitLayout(context), // Standardowy układ w orientacji pionowej
    );
  }

  Widget _buildPortraitLayout(BuildContext context) {
    // Domyślny układ dla orientacji pionowej (ListView)
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      children: [
        _buildTrailCard(
          context,
          title: 'Szlak Zabytków Techniki',
          imageUrl: 'assets/szlak_zabytkow_techniki.jpg',
          objectCount: 40,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TrailDetailsScreen(
                  trailName: 'Szlak Zabytków Techniki',
                ),
              ),
            );
          },
        ),
        _buildTrailCard(
          context,
          title: 'Szlak Orlich Gniazd',
          imageUrl: 'assets/szlak_orlich_gniazd.jpg',
          objectCount: 14,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TrailDetailsScreen(
                  trailName: 'Szlak Orlich Gniazd',
                ),
              ),
            );
          },
        ),
        _buildTrailCard(
          context,
          title: 'Szlak Architektury Drewnianej',
          imageUrl: 'assets/szlak_architektury_drewnianej.jpg',
          objectCount: 14,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TrailDetailsScreen(
                  trailName: 'Szlak Architektury Drewnianej',
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildLandscapeLayout(BuildContext context) {
    // Układ dla orientacji poziomej (GridView lub inne dostosowania)
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Dwa elementy w poziomie
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 1.0, // Dostosowanie proporcji elementów
      ),
      itemCount: 3, // Liczba elementów
      itemBuilder: (context, index) {
        // Budowanie elementów w gridzie
        return _buildTrailCard(
          context,
          title: index == 0
              ? 'Szlak Zabytków Techniki'
              : index == 1
                  ? 'Szlak Orlich Gniazd'
                  : 'Szlak Architektury Drewnianej',
          imageUrl: index == 0
              ? 'assets/szlak_zabytkow_techniki.jpg'
              : index == 1
                  ? 'assets/szlak_orlich_gniazd.jpg'
                  : 'assets/szlak_architektury_drewnianej.jpg',
          objectCount: index == 0 ? 40 : 14,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TrailDetailsScreen(
                  trailName: index == 0
                      ? 'Szlak Zabytków Techniki'
                      : index == 1
                          ? 'Szlak Orlich Gniazd'
                          : 'Szlak Architektury Drewnianej',
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildTrailCard(
    BuildContext context, {
    required String title,
    required String imageUrl,
    required int objectCount,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.only(bottom: 16.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.favorite_border, color: Colors.blue),
                  ),
                ),
                Positioned(
                  right: 10,
                  bottom: 10,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.near_me, color: Colors.blue),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        'ILOŚĆ OBIEKTÓW NA SZLAKU: ',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '$objectCount',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
