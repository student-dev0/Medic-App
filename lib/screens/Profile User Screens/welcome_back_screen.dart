import 'package:flutter/material.dart';
import 'package:medic_clinic_app/screens/Profile%20User%20Screens/appointment_screen.dart';
import 'package:medic_clinic_app/screens/Profile%20User%20Screens/home_page.dart';
import 'package:medic_clinic_app/screens/Profile%20User%20Screens/messages_screen.dart';
import 'package:medic_clinic_app/screens/Profile%20User%20Screens/prescription_screen.dart';
import 'package:medic_clinic_app/screens/Profile%20User%20Screens/user_profile_screen.dart';



class WelcomeBackScreen extends StatefulWidget {
  const WelcomeBackScreen({super.key});

  @override
  State<WelcomeBackScreen> createState() => _WelcomeBackScreenState();
}

class _WelcomeBackScreenState extends State<WelcomeBackScreen> {
  int _selectedIndex = 0;

   // List of Widget pages  
  static const List<Widget> _pages = <Widget>[
    HomePage(),
    PrescriptionScreen(),
    AppointmentScreen(),
    MessagingScreen(),
    UserProfileScreen(),
  ];

  void _onItemTapped(int index) {
    // The "Appointment" button is in the middle (index 2)
    // If it's a special button (e.g., to open a modal), you can handle it here.
    if (index == 2) {
      
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('New Appointment'),
          content: const Text('This could be a form to create a new appointment.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        ),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: screenheight * 0.10,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(36),
            topLeft: Radius.circular(36),
          ),
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            iconSize: 28,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: const Color(0xFF66CA98),
            unselectedItemColor: const Color(0xFFA7A6A5),
            items:  [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.article_outlined), label: 'Recipie'),
              BottomNavigationBarItem(
                  icon: (Icon(
                    Icons.add_circle_rounded,
                    color:  Color(0xFF66CA98),
                    size: 52,
                  )),
                  label: 'Appointment'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.chat_bubble_outline), label: 'Message'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline), label: 'Info'),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped, // Use the updated tap handler
          ),
        ),
      ),
      // The redirection is due to selected index
      body: _pages.elementAt(_selectedIndex),
    );
  }
}

