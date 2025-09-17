import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFEFF2F1),
      // appBar:AppBar(leading: BackButton(),),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Welcome Back $User!',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(width: screenWidth * 0.3),
                Icon(
                  Icons.notification_important,
                  size: 30,
                  color: Colors.grey,
                ),
              ],
            ),

            SizedBox(height: 2),

            Padding(
              padding: EdgeInsets.fromLTRB(36, 0, 24, 0),
              child: Row(
                children: [
                  Icon(Icons.location_on_outlined, color: Colors.grey),
                  SizedBox(width: 5),
                  Text(
                    'Lagos State , Nigeria',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16)
              ),
              child: TextField(
                
              ),
            )
          ],
        ),
      ),
    );
  }
}
