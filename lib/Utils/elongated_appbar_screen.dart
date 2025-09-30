import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';




class ElongatedAppbarScreen extends StatelessWidget {
  final String assetImage;
  final String name;
  final String specialization;
  final int amount;

  final double rating;
  final Widget body;

  const ElongatedAppbarScreen({
    super.key,
    required this.assetImage,
    required this.name,
    required this.specialization,
    required this.rating,
    required this.amount,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF2F1),

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            bottom: 8,
            left: 8,
            right: 16,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
          ),

          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 20),
                child: Stack(
                  children: [
                    Image.asset(
                      assetImage,
                      width: 130,
                      height: 130,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Container(
                        width: 50,
                        height: 30,
                        
                        alignment: Alignment.center,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),color: Colors.white,),
                        child: Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Color(0xFFF4A3EC),
                                size: 16,
                              ),
                              Text(
                                rating.toString(),
                                style: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:20.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                            text: name,
                            style: GoogleFonts.lato(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                    
                            children: [
                              TextSpan(
                                text: '\n$specialization',
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      
                    ),
                  ),
                  SizedBox(height: 50),

                  Row(
                    children: [
                      Image.asset('assets/images/icon_chat.png'),
                      SizedBox(width: 10),
                      Image.asset('assets/images/icon_phone.png'),
                      SizedBox(width: 10),
                    ],
                  ),
                ],
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:20.0),
                    child: Icon(Icons.more_horiz, size: 50, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(top:30.0),
                    child: Row(
                      children: [
                        Text(
                          '\$ $amount',
                          style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 40,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: body,
    );
  }
}

