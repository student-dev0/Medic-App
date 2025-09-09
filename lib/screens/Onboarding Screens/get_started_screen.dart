import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic_clinic_app/screens/Onboarding%20Screens/user_screen.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Top Section: Image + Logo
          Stack(
            alignment: Alignment.topCenter,
            children: [
              // Doctor Image Background
              Image(
                image: AssetImage('assets/images/smaller_starting_image.png'),
              ),

              // Logo Positioned at the top
              Positioned(
                top: 50,
                child: Row(
                  children: [
                    Image(image: AssetImage('assets/images/Logo.png')),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Expanded section for spacing + text
          SizedBox(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Manage your health and \n             happy future",
                  style: GoogleFonts.outfit(
                    fontSize: 28,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),

          // Bottom Button
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const UserScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3DDC97),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text(
                  "Get started",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
