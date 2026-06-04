import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(const MaterialApp(
    home: FinalHomeScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class ToToScanTheme {
  static const Color noirCinema = Color(0xFF0A0B10);
  static const Color grisArdoise = Color(0xFF161722);
  static const Color jaunePopCorn = Color(0xFFFFC107);
  static const Color cyanScan = Color(0xFF00E5FF);
}

class FinalHomeScreen extends StatelessWidget {
  const FinalHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF141522), ToToScanTheme.noirCinema],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.between,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Column(
                  children: [
                    Text(
                      'ToTo scan',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 2.0,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 15.0,
                            color: ToToScanTheme.cyanScan.withOpacity(0.3),
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'L\'INTELLIGENCE VISUELLE DU CINÉMA',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 3.0,
                        color: Colors.white38,
                      ),
                    ),
                  ],
                ),
              ),

              Column(
                children: [
                  GestureDetector(
                    onTap: () => print("Scan lancé..."),
                    child: Container(
                      width: 170,
                      height: 170,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ToToScanTheme.jaunePopCorn,
                        boxShadow: [
                          BoxShadow(
                            color: ToToScanTheme.jaunePopCorn.withOpacity(0.35),
                            blurRadius: 40,
                            spreadRadius: 8,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.center_focus_weak_rounded,
                        size: 70,
                        color: ToToScanTheme.noirCinema,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    "Appuyez pour scanner",
                    style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w500, letterSpacing: 0.5),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 40.0, left: 30.0, right: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildGlassButton(Icons.photo_library_outlined, "Galerie"),
                    _buildGlassButton(Icons.link_rounded, "Coller un lien"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildGlassButton(IconData icon, String label) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: 130,
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.04),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white.withOpacity(0.08)),
          ),
          child: Column(
            children: [
              Icon(icon, color: ToToScanTheme.cyanScan, size: 26),
              const SizedBox(height: 8),
              Text(label, style: const TextStyle(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ),
    );
  }
}
