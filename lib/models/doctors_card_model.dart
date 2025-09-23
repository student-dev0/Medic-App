import 'package:flutter/material.dart';

class DoctorCard extends StatefulWidget {
  final String assetImage;
  final String name;
  final String specialization;

  final int reviews;
  final double rating;


  final VoidCallback? onTap;

  const DoctorCard({
    super.key,
    required this.assetImage,
    required this.name,
    required this.specialization,
   
    
    required this.reviews,
  
    required this.rating,
    
    required this.onTap,
  });
  @override
  State<DoctorCard> createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenheight = MediaQuery.of(context).size.height;
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {},
      child: Container(
        width: 500,
        height: 140,
        padding: EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: Color(0xFFF5F5F5),
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
                      'assets/images/Eleanor Pena.png',
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
                          RichText(text:TextSpan(
                            text: widget.name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: '\n${widget.specialization}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ) ,
                          ),
                          SizedBox(width: screenWidth * 0.40),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text(
                              '(${widget.reviews} Reviews)',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white70,
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Icon(
                            Icons.star,
                            color: Colors.orangeAccent,
                            size: 24,
                          ),
                          Text(
                            (widget.rating).toString(),
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                            ),
                          ),
                        ],
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
