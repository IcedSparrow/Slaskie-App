import 'package:flutter/material.dart';
import 'trail_details_mapa_screen.dart'; // Upewnij się, że importujesz ten plik
import 'dart:math';

class TrailInfoScreen extends StatelessWidget {
  final String trailName;

  const TrailInfoScreen({Key? key, required this.trailName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Informacje o szlaku: $trailName',
          style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          // Dodajemy ikonę serduszka
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.blue), // Ikona serduszka
            onPressed: () {
              // Akcja dla serduszka, np. dodanie do ulubionych
              print('Dodano do ulubionych');
            },
          ),
          // Dodajemy ikonę samolotu papierowego z obrotem o 45 stopni
          IconButton(
            icon: Transform.rotate(
              angle: -pi / 4, // Obrót o 45 stopni w górę do prawego rogu
              child: Icon(Icons.send, color: Colors.blue), // Ikona samolotu papierowego
            ),
            onPressed: () {
              // Przejście do ekranu z mapą Katowic
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TrailDetailsMapaScreen()),
              );
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isLandscape = constraints.maxWidth > constraints.maxHeight;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Sekcja z obrazkami
                Container(
                  height: isLandscape ? 300 : 200, // Zwiększ wysokość w trybie poziomym
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildImage('assets/image1.jpg'), // Zmień na odpowiednią ścieżkę do zdjęcia
                      _buildImage('assets/image2.jpg'), // Zmień na odpowiednią ścieżkę do zdjęcia
                    ],
                  ),
                ),
                // Sekcja z tekstem
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Szlak Zabytków Techniki',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Szlak Zabytków Techniki utworzono poprzez połączenie kilkudziesięciu różnego rodzaju industrialnych obiektów. Działanie to stworzyło nową wartość (kompleksowa oferta zwycięża pojedynczą usługę) kreując unikalny produkt, który oparty jest na materialnym i niematerialnym dziedzictwie przemysłowym regionu śląskiego. Szlak Zabytków Techniki jako sieciowy produkt turystyczny obszaru stanowi też „unikatną propozycję sprzedaży” województwa śląskiego na rynku regionalnych ofert turystycznych. Oddaje specyfikę regionu, w którym kultura przemysłowa stanowi jeden z zasadniczych elementów jego tożsamości. Przygotowany Szlak nie jest samodzielnym, oderwanym tworem, ale jednym z kluczowych przedsięwzięć związanych z promocją regionu. W założeniu ma być produktem integrującym i aktywizującym całe województwo śląskie.',
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      ),
                      SizedBox(height: 16),
                      // Link do strony
                      Row(
                        children: [
                          Icon(Icons.language, color: Colors.blue),
                          SizedBox(width: 8),
                          InkWell(
                            onTap: () {
                              // Akcja otwierania linku, tutaj symulacja
                              print('Otwórz www.zabytkitechniki.pl');
                            },
                            child: Text(
                              'www.zabytkitechniki.pl',
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
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

  Widget _buildImage(String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(
          imagePath,
          height: 200,
          width: 300,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
