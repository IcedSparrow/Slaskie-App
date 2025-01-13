import 'package:flutter/material.dart';
import '../widgets/landmark_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<bool> isFavoriteList = [false, false, false, false, false, false]; // Lista stanu ulubionych miejsc

  void toggleFavorite(int index) {
    setState(() {
      isFavoriteList[index] = !isFavoriteList[index]; // Zmiana stanu ulubionych
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.blue),
          onPressed: () {},
        ),
        title: Center(
          child: Text(
            'Śląskie.',
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.blue),
            onPressed: () {
              // Navigate to the FavoriteTrailsScreen when the heart icon is pressed
              Navigator.pushNamed(context, '/favoriteTrails');
            },
          ),
          IconButton(icon: Icon(Icons.search, color: Colors.blue), onPressed: () {}),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          // W orientacji pionowej, 2 kolumny, w poziomej 3 kolumny
          int crossAxisCount = orientation == Orientation.portrait ? 2 : 3;
          double childAspectRatio = orientation == Orientation.portrait ? 0.8 : 1.0;

          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Polecane',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Transform.rotate(
                          angle: 90 * 3.14159 / 180,
                          child: Text(
                            '〉',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: crossAxisCount,
                childAspectRatio: childAspectRatio,
                padding: EdgeInsets.all(8.0),
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                children: [
                  // Zaplanuj podróż
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/plan_trip');
                    },
                    child: _buildCard('Zaplanuj podróż', Colors.teal, '', '', showArrow: true),
                  ),
                  LandmarkCard(
                    title: 'Planetarium Śląskie Park Nauki w Chorzowie',
                    imageUrl: 'assets/planetarium.jpg',
                    onTap: () {},
                    label: 'EKSPLORUJ',
                  ),
                  // Szlaki
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/trails');
                    },
                    child: _buildCard('Szlaki', Colors.blue, '', '', showArrow: true),
                  ),
                  LandmarkCard(
                    title: 'Gala muzyki filmowej Katowice, Spodek',
                    imageUrl: 'assets/gala.jpg',
                    onTap: () {},
                    showHeart: true,
                    isFavorite: isFavoriteList[1],
                    onFavoriteToggle: () => toggleFavorite(1),
                    label: 'WYDARZENIA',
                  ),
                  LandmarkCard(
                    title: 'Museum Górnośląski Park Etnograficzny...',
                    imageUrl: 'assets/muzeum.jpg',
                    onTap: () {},
                    label: 'EKSPLORUJ',
                    showHeart: true,
                    isFavorite: isFavoriteList[2],
                    onFavoriteToggle: () => toggleFavorite(2),
                  ),
                  LandmarkCard(
                    title: 'Museum Historyczne w Bielsku-Białej',
                    imageUrl: 'assets/muzeum_historiczne.jpg',
                    onTap: () {},
                    label: 'EKSPLORUJ',
                    showHeart: true,
                    isFavorite: isFavoriteList[3],
                    onFavoriteToggle: () => toggleFavorite(3),
                  ),
                ],
              ),
            ],
          );
        },
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Śląskie',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.new_releases),
            label: 'Aktualności',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Wydarzenia',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Eksploruj',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {},
      ),
    );
  }

  Widget _buildCard(String title, Color color, String imageUrl, String label, {bool showHeart = false, bool showArrow = false}) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16),
            image: imageUrl.isNotEmpty
                ? DecorationImage(
                    image: AssetImage(imageUrl),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                if (label.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      label,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
              ],
            ),
          ),
        ),
        if (showHeart)
          Positioned(
            top: 8,
            right: 8,
            child: Icon(Icons.favorite_border, color: Colors.white),
          ),
        if (showArrow)
          Positioned(
            top: 8,
            right: 8,
            child: Transform.rotate(
              angle: -45 * 3.14159 / 180, // Obrót o 45 stopni w górę
              child: Text(
                '〉',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
