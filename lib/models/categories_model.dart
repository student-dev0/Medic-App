import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesModel extends StatelessWidget {
  final String assetImage;
  final Color color;
  final String text;
  const CategoriesModel({
    super.key,
    required this.assetImage,
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 140,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 80, // Adjust size as needed for the image
              height: 80, // Adjust size as needed for the image
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset(assetImage,width: 80,height: 50,fit: BoxFit.scaleDown,),
                
              ),
            ),
            Text(
              text,
              style: GoogleFonts.lato(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ), // Text at the bottom
          ],
        ),
      ),
    );
  }
}
