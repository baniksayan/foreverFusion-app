import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../server_handler.dart';
import './sellers_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showLoadingSellers = false;
  Timer? _timer;

  void getSellers() {
    ServerHandler()
        .getSellers()
        .then((value) => Navigator.of(context).pushReplacementNamed(SellersScreen.routeName, arguments: value))
        .catchError((e) => print("Error fetching sellers: $e"));
  }

  @override
  void initState() {
    super.initState();

    _timer = Timer(const Duration(seconds: 3), () {
      getSellers();
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
            Text(
              "ForeverFusion",
              style: GoogleFonts.pacifico(
                color: Color(0xffC599B6),
                fontSize: 32,
              ),
            ),
            if (showLoadingSellers) ...[
              const SizedBox(height: 20),
              const SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xffC599B6)), 
                  strokeWidth: 2,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Loading...', 
                style: GoogleFonts.poppins(
                  color: Color(0xffC599B6), 
                  fontSize: 16,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
