import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic_clinic_app/screens/Onboarding%20Screens/get_started_screen.dart';
// import 'package:medic_clinic_app/screens/Onboarding%20Screens/get_started_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // This timer will navigate to the home page after 3 seconds.
    Timer(
      const Duration(seconds: 15),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const GetStartedScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // You can add your app logo here
            // Example: Image.asset('assets/logo.png', width: 150),
            Text(
              'Self Care',
              style: GoogleFonts.outfit(
                textStyle: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const SizedBox(height: 20),
            Image(image: const AssetImage('assets/images/logo_health.png')),
          ],
        ),
      ),
    );
  }
}
