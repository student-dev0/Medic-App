import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic_clinic_app/screens/Doctors%20Appointment%20Screens/elenor_pena.dart';

class DoctorInfoModelAppointment extends StatefulWidget {
  final String assetImage;
  final String name;
  final String specialization;
  final int date = DateTime.now().day;
  final int month = DateTime.now().month;
  final int reviews;
  final double rating;
  final double amount;
  final int time = DateTime.now().hour;
  final VoidCallback? onTap;

  DoctorInfoModelAppointment({
    super.key,
    required this.assetImage,
    required this.name,
    required this.specialization,
    required date,
    required month,
    required this.reviews,
    required this.amount,
    required this.rating,
    required time,
    required this.onTap,
  });
  @override
  State<DoctorInfoModelAppointment> createState() =>
      _DoctorInfoModelAppointmentState();
}

class _DoctorInfoModelAppointmentState
    extends State<DoctorInfoModelAppointment> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => EleanorTransition(
              patient: 413,
              experience: '5 years',
              rating: 4.8,
            ),
          ),
        );
      },
      child: Container(
        width: 500,
        height: 130,
        padding: EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: Color(0xFF6295E2),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 1.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/images/Eleanor_Pena.png',
                      width: 60,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 8),

                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [
                          RichText(
                            text: TextSpan(
                              text: widget.name,
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              children: [
                                TextSpan(
                                  text: '\n${widget.specialization}',
                                  style: GoogleFonts.outfit(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                Spacer(),

                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '(${widget.reviews} Reviews)',

                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),

                        const SizedBox(width: 5),
                        const Icon(
                          Icons.star,
                          color: Colors.orangeAccent,
                          size: 16,
                        ),
                        Text(
                          (widget.rating).toString(),
                          style: TextStyle(fontSize: 16, color: Colors.white70),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.calendar_month,
                    size: 20,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    (widget.date).toString(),
                    style: GoogleFonts.sourceSans3(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '/ ${widget.month.toString()}',
                    style: GoogleFonts.sourceSans3(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Icon(Icons.access_time, size: 20, color: Colors.white),
                  const SizedBox(width: 4),
                  Text(
                    '${widget.time.toString()}:00 PM',
                    style: GoogleFonts.sourceSans3(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    ('\$ ${widget.amount}').toString(),
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
