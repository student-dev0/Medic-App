import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic_clinic_app/screens/Onboarding%20Screens/user_info_screen.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  String? selectedRole; // patient or doctor 

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
            SizedBox(height: screenheight * 0.05),

            Text(
              'Let\'s get acquainted',
              style: GoogleFonts.outfit(
                fontSize: 28,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),

            SizedBox(height: 10),

            Text(
              '  Welcome! Select your role to continue',
              style: GoogleFonts.outfit(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.grey[600],
              ),
            ),

            SizedBox(height: 40),

             AnimatedScale(
                scale: selectedRole == "patient" ? 1.05 : 1.0,
                duration: Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                child: GestureDetector(
                  onTap: () {
                    setState(() => selectedRole = "patient");
                  },
                  child: SizedBox( width: screenWidth*0.92,
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: selectedRole == "patient"
                            ? Colors.green[50]
                            : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: selectedRole == "patient"
                              ? Color(0xFF66CA98)
                              : Colors.grey[300]!,
                          width: 2,
                        ),
                      ),
                      child: Row(
                        children: [
                          // Icon in square
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: selectedRole == "patient"
                                  ? Color(0xFF66CA98)
                                  : Colors.grey[200],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              Icons.person,
                              color: selectedRole == "patient"
                                  ? Colors.white
                                  : Colors.black54,
                              size: 28,
                            ),
                          ),
                          SizedBox(width: 16),
                          // Texts
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "I’m a patient",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: selectedRole == "patient"
                                      ? Color(0xFF66CA98)
                                      : Colors.black87,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Book appointments, receive reports",
                                style: TextStyle(
                                  color: selectedRole == "patient"
                                      ? Color(0xFF66CA98)
                                      : Colors.grey[600],
                                  fontSize: 14,
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
                scale: selectedRole == "doctor" ? 1.05 : 1.0,
                duration: Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                child: GestureDetector(
                  onTap: () {
                    setState(() => selectedRole = "doctor");
                  },
                  child: SizedBox( width: screenWidth*0.92,
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: selectedRole == "doctor"
                            ? Colors.green[50]
                            : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: selectedRole == "doctor"
                              ? Color(0xFF66CA98)
                              : Colors.grey[300]!,
                          width: 2,
                        ),
                      ),
                      child: Row(
                        children: [
                          // Icon in square
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: selectedRole == "doctor"
                                  ? Color(0xFF66CA98)
                                  : Colors.grey[200],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              Icons.medical_services,
                              color: selectedRole == "doctor"
                                  ? Colors.white
                                  : Colors.black54,
                              size: 28,
                            ),
                          ),
                          SizedBox(width: 16),
                          // Texts
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "I’m a doctor",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: selectedRole == "doctor"
                                      ? Color(0xFF66CA98)
                                      : Colors.black87,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Connect with patients, manage sessions",
                                style: TextStyle(
                                  color: selectedRole == "doctor"
                                      ? Color(0xFF66CA98)
                                      : Colors.grey[600],
                                  fontSize: 14,
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


            const Spacer(),

            ElevatedButton(
              onPressed: selectedRole == null
                  ? null
                  : () {
                      print('Selected Role: $selectedRole');
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => UserInfoScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(300, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      backgroundColor: Color(0xFF66CA98),
                    ),
              child: Text('Continue',style: TextStyle(fontSize: 16,color:Colors.white),),
            ),
            SizedBox(height:50),
          ],
        ),
      ),
    );
  }
}
