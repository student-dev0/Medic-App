import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic_clinic_app/screens/Doctors%20Appointment%20Screens/appointment_booking_screen.dart';


class AnimatedAppointmentButton extends StatefulWidget {
  const AnimatedAppointmentButton({super.key});

  @override
  State<AnimatedAppointmentButton> createState() =>
      _AnimatedAppointmentButtonState();
}

class _AnimatedAppointmentButtonState extends State<AnimatedAppointmentButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // Animation Controller for looping arrow animation
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);

    // Slide animation for arrow (left-right movement)
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0.2, 0), // slight move to the right
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose;
    super.dispose();
  }

  void _nextPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const AppointmentBookingScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity != null && details.primaryVelocity! > 0) {
          _nextPage(context);
        }
      },
      child:Container(
        padding:EdgeInsets.symmetric(horizontal:20, vertical : 14),
        decoration:BoxDecoration(
          color:Color(0xFF66CA98),
          borderRadius: BorderRadius.circular(12)
        ),
        child:Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [ // left side of the container 
            Row(children: [
              Icon(Icons.circle,size:10,color:Colors.white),
              SizedBox(width:8),
              Text('Make Appointment', style:GoogleFonts.sourceSans3(fontSize: 16,color:Colors.white))
            ],),
            //Animated Row on the right side of the container
            SlideTransition(position: _slideAnimation,child:Row(children: [Icon(Icons.double_arrow_sharp, color:Colors.white,size:18)],))
          ],)
      )
    );
  }
}
