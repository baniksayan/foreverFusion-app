import 'package:flutter/material.dart';

void main() {
  runApp(ForeverFusionApp());
}

class ForeverFusionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {"icon": Icons.location_city, "label": "Venue"},
    {"icon": Icons.camera_alt, "label": "Photography"},
    {"icon": Icons.brush, "label": "Makeup"},
    {"icon": Icons.music_note, "label": "Music"},
    {"icon": Icons.restaurant, "label": "Catering"},
    // {"icon": Icons.card_giftcard, "label": "Gifts"},
    // {"icon": Icons.shopping_bag, "label": "Bridal Wear"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Logo or Title
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "ForeverFusion",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.pinkAccent,
                ),
              ),
            ),
          ),

          // Category Circles
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: categories.map((category) {
                return Column(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [Colors.pinkAccent, Colors.blueAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 5,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Icon(
                        category["icon"],
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      category["label"],
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
