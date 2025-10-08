import 'package:flutter/material.dart';
import 'package:medic_clinic_app/Utils/animated_appointment_button.dart';
import 'package:medic_clinic_app/Utils/elongated_appbar_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic_clinic_app/Utils/map_by_google.dart';
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

              SizedBox(height: 30),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Location',
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: Colors.black54,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          "3891 Ranchview Dr.\nRichardson,\nSan Francisco 62639",
                          style: GoogleFonts.outfit(
                            fontSize: 14,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                      const SizedBox(width: 50),
                      const Icon(
                        Icons.local_hospital_outlined,
                        color: Colors.black54,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          "Jane Cooper\nMedical College",
                          style: GoogleFonts.outfit(
                            fontSize: 14,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 40),

              Mapping(),

              SizedBox(height: 40),

              AnimatedAppointmentButton(),
            ],
          ),
        ),
      ),
    );
  }

  // Add any additional widgets or functionality here
}
