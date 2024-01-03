import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = _calculateCrossAxisCount(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('  GridView'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: 12, // Anzahl der Container
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: _getRandomColor(),
            height: 100,
            width: 150,
            child: Center(
              child: Text('Element $index'),
            ),
          );
        },
      ),
    );
  }

  // Funktion zum Abrufen einer zufälligen Farbe
  Color _getRandomColor() {
    return Color.fromARGB(
      255,
      _getRandomValue(),
      _getRandomValue(),
      _getRandomValue(),
    );
  }

  // Hilfsfunktion zum Generieren zufälliger RGB-Werte
  int _getRandomValue() {
    return 50 + _getRandom().nextInt(156); // Wert zwischen 50 und 205
  }

  // Hilfsfunktion zur Erstellung einer Random-Instanz
  Random _getRandom() {
    return Random();
  }

  // Funktion zum Berechnen der Anzahl der Elemente pro Reihe basierend auf der Bildschirmbreite
  int _calculateCrossAxisCount(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Je nach Bildschirmbreite unterschiedliche Anzahl an Elementen pro Reihe
    if (screenWidth > 600) {
      return 4;
    } else if (screenWidth > 400) {
      return 3;
    } else {
      return 2;
    }
  }
}
