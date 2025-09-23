import 'package:flutter/material.dart';
import 'package:medic_clinic_app/models/categories_model.dart';
import 'package:medic_clinic_app/models/doctor_info_model_appointment.dart';
import 'package:medic_clinic_app/models/doctors_card_model.dart';
import 'package:medic_clinic_app/models/search_model_homepage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    // double screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFFEFF2F1),
      // appBar:AppBar(leading: BackButton(),),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,

        child: Column(
          children: [
            SizedBox(height: 50),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 16.0),
                  child: Text(
                    'Welcome Back $User!',
                    style: GoogleFonts.lato(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.notifications,
                    size: 30,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.only(left: 24),
              child: Row(
                children: [
                  Icon(
                    Icons.location_disabled_rounded,
                    color: Colors.grey[600],
                    size: 16,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Lagos State, Nigeria',
                    style: GoogleFonts.lato(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: 80,
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      shape: BoxShape.rectangle,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search 'heart'",
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF66CA98),
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Container(
                    width: 45,
                    height: 50,

                    decoration: BoxDecoration(
                      color: Color(0xFF66CA98),
                      borderRadius: BorderRadius.circular(8),
                      shape: BoxShape.rectangle,
                    ),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Icon(Icons.tune_rounded, color: Colors.white),
                    ),
                  ),
                ),

                Padding(padding: EdgeInsets.only(right: 12)),
              ],
            ),
            SizedBox(height: 10),

            SearchModel(),

            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent',
                    style: GoogleFonts.lato(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'See all',
                    style: GoogleFonts.lato(
                      decoration: TextDecoration.underline,
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            DoctorInfoModelAppointment(
              assetImage: 'assets/DoctorImages/Eleanor_Pena.png',
              name: 'Eleanor Pena',
              specialization: 'Pediatrics',
              date: 27,
              month: 'September',
              reviews: 300,
              amount: 90,
              rating: 4.8,
              time: '${TimeOfDay.now().hour} pm',
              onTap: () {},
            ),

            SizedBox(height: 15,),

            // assets\DoctorImages\Eleanor_Pena.png

        
             Padding(
               padding: const EdgeInsets.symmetric(horizontal:16.0),
               child: Row( mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Text('Categories',style:GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.bold)),
                 ],
               ),
             ),

             SizedBox(height: 10,),

             SingleChildScrollView(scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    CategoriesModel(assetImage:'assets/images/icon_heart.png', color: Color(0xFFFFE2DC), text: 'Cardiologist'),
                    SizedBox(width: 12),
                    CategoriesModel(assetImage:'assets/images/icon_eye.png', color: Color(0xFFE0EAF9), text: 'Ophthamologist'),
                    SizedBox(width: 12),
                    CategoriesModel(assetImage:'assets/images/icon_tooth.png', color: Color(0xFFFFF7DC), text: 'Dentist'),
                  ],
                ),
              ),
             ),

             SizedBox(height: 10,),

              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Doctors',
                    style: GoogleFonts.lato(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'See all',
                    style: GoogleFonts.lato(
                      decoration: TextDecoration.underline,
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            DoctorCard(assetImage: '', name: 'Dr Floyd Miles', specialization: 'Dentist', reviews: 320, rating: 4.9, onTap: (){})
            

          ],
        ),
      ),
    );
  }
}
