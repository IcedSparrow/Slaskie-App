import 'package:flutter/material.dart';

class PlanTripScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Zaplanuj podróż',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isLandscape = constraints.maxWidth > constraints.maxHeight;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // W orientacji poziomej zmieniamy układ inputów
                if (isLandscape)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: _buildInputField('Skąd jedziesz?', Icons.gps_fixed, false)),
                      SizedBox(width: 8),
                      Expanded(child: _buildInputField('Dodaj punkt pośredni', Icons.close, true)),
                      SizedBox(width: 8),
                      Expanded(child: _buildInputField('Dokąd jedziesz?', Icons.gps_fixed, false)),
                    ],
                  )
                else
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInputField('Skąd jedziesz?', Icons.gps_fixed, false),
                      SizedBox(height: 8),
                      _buildInputField('Dodaj punkt pośredni', Icons.close, true),
                      SizedBox(height: 8),
                      _buildInputField('Dokąd jedziesz?', Icons.gps_fixed, false),
                    ],
                  ),
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 14.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/map');
                    },
                    icon: Icon(Icons.location_on),
                    label: Text(
                      'Pokaż na mapie',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  'Zobacz w pobliżu',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),
                // Zmieniamy sposób wyświetlania listy landmarków w zależności od orientacji
                Expanded(
                  child: isLandscape
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(child: _buildLandmarkTile(context, 'Zabytkowa Kopalnia Ignacy w Rybniku', 'ul. Ignacego Mościckiego 3\n44-273 Rybnik', 'assets/ignacy.jpg')),
                            SizedBox(width: 8),
                            Expanded(child: _buildLandmarkTile(context, 'Kopalnia Guido', 'ul. 3 Maja 93\n41-800 Zabrze', 'assets/guido.jpg')),
                            SizedBox(width: 8),
                            Expanded(child: _buildLandmarkTile(context, 'Kolej Wąskotorowa Rudy', 'ul. Szkolna 1', 'assets/rudy.jpg')),
                          ],
                        )
                      : ListView(
                          children: [
                            _buildLandmarkTile(context, 'Zabytkowa Kopalnia Ignacy w Rybniku', 'ul. Ignacego Mościckiego 3\n44-273 Rybnik', 'assets/ignacy.jpg'),
                            _buildLandmarkTile(context, 'Kopalnia Guido', 'ul. 3 Maja 93\n41-800 Zabrze', 'assets/guido.jpg'),
                            _buildLandmarkTile(context, 'Kolej Wąskotorowa Rudy', 'ul. Szkolna 1', 'assets/rudy.jpg'),
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

  Widget _buildInputField(String label, IconData icon, bool isClearable) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        labelText: label,
        labelStyle: TextStyle(fontSize: 14, color: Colors.grey[600]),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        suffixIcon: Icon(icon, color: Colors.grey),
      ),
    );
  }

  Widget _buildLandmarkTile(BuildContext context, String title, String subtitle, String imagePath) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            imagePath,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(fontSize: 12, color: Colors.grey[700]),
        ),
        trailing: Icon(
          Icons.add_circle,
          color: Colors.green,
          size: 24,
        ),
        onTap: () {
          // Akcja po kliknięciu
        },
      ),
    );
  }
}
