import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';


class ScheduleSelectorModel extends StatefulWidget {
  const ScheduleSelectorModel({super.key});

  @override
  State<ScheduleSelectorModel> createState() => _ScheduleSelectorModelState();
}

class _ScheduleSelectorModelState extends State<ScheduleSelectorModel> {
  int? selectedDateIndex;
  int? selectedTimeIndex;

  // To generate the next 15 days dynamically

  final List<DateTime> upComingDates = List.generate(
    15,
    (i) => DateTime.now().add(Duration(days: i)),
  );

  

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(upComingDates.length, (index) {
          bool isSelected = selectedDateIndex == index;
          DateTime date = upComingDates[index];
          String day = DateFormat("d").format(date);
          String month = DateFormat("MMM").format(date);

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedDateIndex = index;
              });
            },
            child: Container(
              width: 90,
              height: 90,
              margin: EdgeInsets.only(right: 20),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              decoration: BoxDecoration(
                color: isSelected ? Color(0xFF66CA98) : Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    spreadRadius: 2,
                    offset: Offset(4, 0),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
              
                children: [
                  Text(
                    day,
                    style: GoogleFonts.lato(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: isSelected ? Color(0xFFF5F5F5) : Colors.black,
                    ),
                  ),
                  Text(
                    month,
                    style: GoogleFonts.lato(
                      fontSize: 18,
                      color: isSelected ? Color(0xFFF5F5F5) : Colors.black54,
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
