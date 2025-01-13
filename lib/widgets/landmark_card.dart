import 'package:flutter/material.dart';

class LandmarkCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final VoidCallback onTap;
  final bool showHeart;
  final bool isFavorite; // Dodany parametr isFavorite
  final VoidCallback? onFavoriteToggle; // Dodana funkcja dla zmiany stanu ulubionych
  final String label;

  LandmarkCard({
    required this.title,
    required this.imageUrl,
    required this.onTap,
    this.showHeart = false,
    this.isFavorite = false, // Domyślnie nie jest ulubione
    this.onFavoriteToggle, // Opcjonalna funkcja
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(imageUrl, fit: BoxFit.cover, height: 150, width: double.infinity),
                if (showHeart)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: GestureDetector(
                      onTap: onFavoriteToggle, // Obsługa kliknięcia na ikonę serca
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: Colors.white,
                      ),
                    ),
                  ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    color: Colors.black.withOpacity(0.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          label,
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
