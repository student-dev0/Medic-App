import 'package:flutter/material.dart';
// import 'package:medic_clinic_app/Utils/direction_map.dart';
import 'package:medic_clinic_app/Utils/elongated_appbar_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic_clinic_app/Utils/mappings.dart';
import 'package:medic_clinic_app/models/schedule_selector_model.dart';
import 'package:medic_clinic_app/models/time_selector_model.dart';

class EleanorTransition extends StatefulWidget {
  final int patient;
  final String experience;
  final double rating;
  const EleanorTransition({
    super.key,
    required this.patient,
    required this.experience,
    required this.rating,
  });

  @override
  State<EleanorTransition> createState() => _EleanorTransitionState();
}

class _EleanorTransitionState extends State<EleanorTransition> {
  @override
  Widget build(BuildContext context) {
    return ElongatedAppbarScreen(
      assetImage: 'assets/images/icon_Dr.Eleanor_Pena.png',
      name: 'Dr Eleanor Pena',
      specialization: 'Paediatrics',
      rating: 4.8,
      amount: 80,

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'Patients',
                        style: GoogleFonts.robotoFlex(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 15),

                      Container(
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.grey),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xFFCDCFCE),
                        ),
                        child: Center(
                          child: Text(
                            '+ ${widget.patient.toString()}',
                            style: GoogleFonts.sourceSans3(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(width:15),
                  Spacer(),
                  Column(
                    children: [
                      Text(
                        'Experience',
                        style: GoogleFonts.robotoFlex(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 15),

                      Container(
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.grey),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xFFCDCFCE),
                        ),
                        child: Center(
                          child: Text(
                            '+ ${widget.experience.toString()}',
                            style: GoogleFonts.sourceSans3(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(width:15),
                  Spacer(),
                  Column(
                    children: [
                      Text(
                        'Rating',
                        style: GoogleFonts.robotoFlex(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 15),

                      Container(
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.grey),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xFFCDCFCE),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.rating.toString(),
                                style: GoogleFonts.sourceSans3(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 5),

                              Icon(
                                Icons.star,
                                color: const Color.fromARGB(255, 231, 138, 247),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Schedule',
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [ScheduleSelectorModel()]),
              ),

              SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Time',
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [TimeSelectorModel()]),
              ),

              SizedBox(height: 50),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About the doctor',
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Dr. Elenor Pena is a highly skilled paediatrician with over 5 years of experience in her field. She pioneered community based vaccination programs that drastically reduced infant mortality.',
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),

              SizedBox(height: 30,),

              Mapping(),

              SizedBox(height: 50,),
            ],
          ),
        ),
      ),
    );
  }

  // Add any additional widgets or functionality here
}
