import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:medic_clinic_app/models/doctors_card_model.dart';

class BookAppointmentScreen extends StatefulWidget {
  const BookAppointmentScreen({super.key});

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Color(0xFFEFF2F1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(350),
        child: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Color(0xFFF5F5F5)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Row(
            children: [
              SizedBox(width: screenWidth * 0.22),
              Image(image: AssetImage('assets/images/Logo.png'), height: 30),
            ],
          ),

          centerTitle: true,
          flexibleSpace: Container(
            padding: EdgeInsets.only(top: 100, left: 16, right: 16),
            decoration: BoxDecoration(
              color: Color(0xFF66CA98),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Thank you!",
                  style: GoogleFonts.outfit(
                    textStyle: Theme.of(context).textTheme.headlineMedium,
                    color: Color(0xFFf5f5f5),
                  ),
                ),
                Lottie.asset(
                  'assets/images/Success.json',
                  height: 150,
                  width: 150,
                  repeat: true,
                  animate: true,
                  frameRate: FrameRate.composition,
                  controller: _controller,
                  onLoaded: (composition) {
                    _controller.duration = composition.duration;
                    _controller.repeat();
                  },
                ),
                SizedBox(height: 5),
                Text(
                  "Your visit has been succesfully reserved.\nPlease pay for it to get an appointment with\nthe selected doctor",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                    fontSize: 24,
                    color: Color(0xFFF5F5F5),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Column(
          children: [
            DoctorCard(
              assetImage: 'assets/images/Eleanor_Pena.png',
              name: 'Dr Eleanor Pena',
              specialization: 'Paedatrics',
              reviews: 413,
              rating: 4.8,
              onTap: () {},
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Column(
                  children: [
                    Text(
                      'Date:',
                      style: GoogleFonts.montserrat(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '${DateTime.now().day} / ${DateTime.now().month} / ${DateTime.now().year}',
                      style: GoogleFonts.outfit(fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(width: 250),
                Column(
                  children: [
                    Text(
                      'Time:',
                      style: GoogleFonts.montserrat(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '${DateTime.now().hour}:${DateTime.now().minute}',
                      style: GoogleFonts.outfit(fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 30),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 36.0),
                  child: Text(
                    'Location:',
                    style: GoogleFonts.montserrat(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [SizedBox(width:8),
                    const Icon(
                      Icons.location_on_outlined,
                      color: Colors.black54,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        "3891 Ranchview Dr.\nRichardson,\nSan Francisco 62639",textAlign: TextAlign.left,
                        style: GoogleFonts.outfit(
                          fontSize: 16,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                    const SizedBox(width: 170),
                    const Icon(
                      Icons.local_hospital_outlined,
                      color: Colors.black54,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        "Jane Cooper\nMedical College",
                        style: GoogleFonts.outfit(
                          fontSize: 16,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
