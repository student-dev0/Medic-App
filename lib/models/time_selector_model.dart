import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeSelectorModel extends StatefulWidget {
  const TimeSelectorModel({super.key});

  @override
  State<TimeSelectorModel> createState() => _TimeSelectorModelState();
}

class _TimeSelectorModelState extends State<TimeSelectorModel> {
  int? selectedTimeIndex;

  final List<String> times = [
    "09:00 AM",
    "11:00 AM",
    "01:00 PM",
    "03:00 PM",
    "05:00 PM",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(times.length, (index) {
          bool isSelected = selectedTimeIndex == index;
          String time = times[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedTimeIndex = index;
              });
            },
            child: Container(
              width: 100,
              height: 50,
              margin: EdgeInsets.only(right: 30),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              decoration: BoxDecoration(
                color: isSelected ? Color(0xFF66CA98) : Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(4, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    time,
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: isSelected ? Color(0xFFF5F5F5) : Colors.black,
                    ),
                  ),
                 
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
