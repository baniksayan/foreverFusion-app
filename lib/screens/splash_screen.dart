import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFFFFF), // White color at the top
              Color(0xFFFAD0C4), // Light pinkish shade at the bottom
            ],
          ),
        ),
        child: Text(
          "ForeverFusion",
          style: GoogleFonts.pacifico(
            color: Color(0xffC599B6), // Light purple shade for text
            fontSize: 32,
          ),
        ),
      ),
    );
  }
}