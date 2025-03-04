import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showLoadingSellers = false; // Fixed variable type
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer(const Duration(seconds: 3), () {
      setState(() {
        showLoadingSellers = true;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

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
              Color(0xFFFFFFFF), // White at the top
              Color(0xFFFAD0C4), // Light pinkish shade at the bottom
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App Name
            Text(
              "ForeverFusion",
              style: GoogleFonts.pacifico(
                color: Color(0xffC599B6), // Light purple shade for text
                fontSize: 32,
              ),
            ),

            // Loader & Loading Text
            if (showLoadingSellers) ...[
              const SizedBox(height: 20), // Space above loader
              SizedBox(
                height: 30, // Proper loader size
                width: 30,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xffC599B6)), 
                  strokeWidth: 2, // Thinner stroke
                ),
              ),
              const SizedBox(height: 10), // Space between loader & text
              Text(
                'Loading...', 
                style: GoogleFonts.poppins(
                  color: Color(0xffC599B6), 
                  fontSize: 16, // Proper text size
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
