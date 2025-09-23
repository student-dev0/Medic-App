import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchModel extends StatelessWidget {
  const SearchModel({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[300],
              ),
              child: Center(
                child: Text(
                  '#heart',
                  style:  GoogleFonts.sourceSans3(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            SizedBox(width: 15),

             Container(
                      width: 80,
                      height: 30,
                      decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.grey),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[300],
                      ),
                      child: Center(child: Text('#teeth',style:GoogleFonts.sourceSans3(color:Colors.grey[600],fontWeight: FontWeight.bold) ,)),
                    ),

                    SizedBox(width:15),

                    Container(
                      width: 80,
                      height: 30,
                      decoration: BoxDecoration(border: Border.all(width: 1,color:Colors.grey),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[300],
                      ),
                      child: Center(child: Text('#Surgeon',style:GoogleFonts.sourceSans3(color:Colors.grey[600],fontWeight: FontWeight.bold) ,)),
                    ),

                    SizedBox(width:15),

                    Container(
                      width: 80,
                      height: 30,
                      decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.grey),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[300],
                      ),
                      child: Center(child: Text('#eyes',style:GoogleFonts.sourceSans3(color:Colors.grey[600],fontWeight: FontWeight.bold) ,)),
                    ),

                    SizedBox(width:15),
                   
                    Container(
                      width: 80,
                      height: 30,
                      decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.grey),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[300],
                      ),
                      child: Center(child: Text('#Dentist',style:GoogleFonts.sourceSans3(color:Colors.grey[600],fontWeight: FontWeight.bold) ,)),
                    ),

                    SizedBox(width: 15,),

                     Container(
                      width: 80,
                      height: 30,
                      decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.grey),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[300],
                      ),
                      child: Center(child: Text('#Therapy',style:GoogleFonts.sourceSans3(color:Colors.grey[600],fontWeight: FontWeight.bold) ,)),
                    ),

                    SizedBox(width: 15,),

                    Container(
                      width: 80,
                      height: 30,
                      decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.grey),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[300],
                      ),
                      child: Center(child: Text('#Hepatisis',style:GoogleFonts.sourceSans3(color:Colors.grey[600],fontWeight: FontWeight.bold) ,)),
                    ),


          ],
        ),
      ),
    );
  }
}
