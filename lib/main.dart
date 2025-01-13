import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/plan_trip_screen.dart';
import 'screens/map_screen.dart';
import 'screens/trails_screen.dart';
import 'screens/favorite_trails_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Śląskie',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Definicja tras
      routes: {
        '/': (context) => HomeScreen(),
        '/plan_trip': (context) => PlanTripScreen(),
        '/map': (context) => MapScreen(),
        '/trails': (context) => TrailsScreen(),
        '/favoriteTrails': (context) => FavoriteTrailsScreen(favoriteTrails: Set<String>()), // Dodaj tę linię
      },
      // Usuwamy home, ponieważ już mamy zdefiniowaną trasę '/'
      // home: HomeScreen(),
      initialRoute: '/', // Ustawiamy initialRoute jako '/'
    );
  }
}