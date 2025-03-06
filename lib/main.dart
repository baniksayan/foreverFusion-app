import 'package:flutter/material.dart';
import 'screens/splash_screen.dart'; // Importing SplashScreen
import 'screens/sellers_screen.dart';

void main() => runApp(const ForeverFusionApp());

class ForeverFusionApp extends StatelessWidget {
  const ForeverFusionApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forever Fusion',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(), // Change to SplashScreen
      routes: {
        SellersScreen.routeName: (_) => const SellersScreen(), // Add this line
      },
    );
  }
}
