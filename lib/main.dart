import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GridView.count(
          // Anzahl der Elemente pro Reihe basierend auf der Bildschirmgröße festlegen
          crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
          children: List.generate(10, (index) {
            return Container(
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.blue[
                    (index + 1) * 100], // Farbe ändern basierend auf dem Index
                borderRadius: BorderRadius.circular(10.0),
              ),
            );
          }),
        ),
      ),
    );
  }
}
