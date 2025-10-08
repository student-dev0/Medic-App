import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic_clinic_app/screens/Onboarding%20Screens/identity_set.dart';
// import 'package:medic_clinic_app/screens/Profile%20User%20Screens/welcome_back_screen.dart';
import 'package:medic_clinic_app/screens/User%20Authentication%20screens/user_sign_in.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  String? selectedGender; //Male or Female
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            SizedBox(width: screenWidth * 0.3),
            Image(
              image: AssetImage('assets/images/logo_health.png'),
              height: 30,
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenheight * 0.01),
        
            Text(
              'A little about yourself',
              style: GoogleFonts.outfit(
                fontSize: 28,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
        
            Text(
              'Provide your information',
              style: GoogleFonts.outfit(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 40),
        
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 10),
                Text(
                  'Your gender',
                  style: GoogleFonts.outfit(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
        
            SizedBox(height: 10),
        
            Row(
              children: [
                AnimatedScale(
                  scale: selectedGender == "Male" ? 1.05 : 1.0,
                  duration: Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  child: GestureDetector(
                    onTap: () {
                      setState(() => selectedGender = "Male");
                    },
                    child: SizedBox(
                      width: screenWidth * 0.5,
                      height: screenheight * 0.08,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 250),
                        curve: Curves.easeInOut,
                        padding: EdgeInsets.all(16),
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: selectedGender == "Male"
                              ? Colors.green[50]
                              : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: selectedGender == "Male"
                                ? Color(0xFF66CA98)
                                : Colors.grey[300]!,
                            width: 1.5,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: selectedGender == "Male"
                                    ? Color(0xFF66CA98)
                                    : Colors.grey[200],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ImageIcon(
                                AssetImage('assets/images/icon_male.png'),
                                color: selectedGender == "Male"
                                    ? Colors.white
                                    : Colors.black,
                                size: 16,
                              ),
                            ),
                            SizedBox(width: 16),
                            Row(
                              children: [
                                Text(
                                  'Male',
                                  style: GoogleFonts.outfit(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: selectedGender == "Male"
                                        ? Colors.green
                                        : Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
        
                AnimatedScale(
                  scale: selectedGender == "Female" ? 1.05 : 1.0,
                  duration: Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  child: GestureDetector(
                    onTap: () {
                      setState(() => selectedGender = "Female");
                    },
                    child: SizedBox(
                      width: screenWidth * 0.5,
                      height: screenheight * 0.08,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 250),
                        curve: Curves.easeInOut,
                        padding: EdgeInsets.all(16),
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: selectedGender == "Female"
                              ? Colors.green[50]
                              : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: selectedGender == "Female"
                                ? Color(0xFF66CA98)
                                : Colors.grey[300]!,
                            width: 1.5,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: selectedGender == "Female"
                                    ? Color(0xFF66CA98)
                                    : Colors.grey[200],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ImageIcon(
                                AssetImage('assets/images/icon_female.png'),
                                color: selectedGender == "Female"
                                    ? Colors.white
                                    : Colors.black,
                                size: 16,
                              ),
                            ),
                            SizedBox(width: 16),
                            Row(
                              children: [
                                Text(
                                  'Female',
                                  style: GoogleFonts.outfit(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: selectedGender == "Female"
                                        ? Colors.green
                                        : Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenheight * 0.05),
        
            IdentitySet(),

            SizedBox(height: screenheight * 0.33),
        
          
        
          
               ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF66CA98),
                  minimumSize: const Size(300, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => UserSignIn()),
                  );
                },
                child: const Text(
                  "Continue",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            
          ],
        ),
      ),
    );
  }
}
