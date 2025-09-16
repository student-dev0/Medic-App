import 'package:app_links/app_links.dart';
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:medic_clinic_app/Dashboard%20screens/home_page.dart";
import "package:medic_clinic_app/models/validation_models.dart";
import "package:medic_clinic_app/screens/User%20Authentication%20screens/user_sign_up.dart";
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:async';

class UserSignIn extends StatefulWidget {
  const UserSignIn({super.key});

  @override
  State<UserSignIn> createState() => _UserSignInState();
}

class _UserSignInState extends State<UserSignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscure = true;

  final _formKey = GlobalKey<FormState>();
  final supabase = Supabase.instance.client;
  late final AppLinks _applinks;
  StreamSubscription<Uri>? _sub;

  // App Links Implementation (which is just a new subtitute for)

  @override
  void initState() {
    super.initState();
    _initDeepLinks();
  }

   void _initDeepLinks() {
    _applinks = AppLinks();

    // subscribe and keep subscription so we can cancel it later
    _sub = _applinks.uriLinkStream.listen(
      (Uri uri) async {
        // uri is non-nullable, so no need to check for null
        try {
          // await the restore call and optionally store session
          final resp = await supabase.auth.getSessionFromUrl(uri, storeSession: true);

          // Option A: rely on your global onAuthStateChange in main.dart to navigate.
          // Option B: if you prefer immediate local navigation, check response:
          if (resp.session != null && mounted) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => const HomePage()),
              (route) => false,
            );
          } else {
            debugPrint('Deep link processed but no session returned: $resp');
          }
        } catch (e, st) {
          debugPrint('Failed to restore session from link: $e\n$st');
        }
      },
      onError: (err) {
        debugPrint('AppLinks stream error: $err');
      },
    );
  }
   @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }



  // supabase function

  Future<void> _signInUser() async {
    if (!_formKey.currentState!.validate()) return; // validate form

    try {
      final supabase = Supabase.instance.client;

      final response = await supabase.auth.signInWithPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      if (response.session != null) {
        // ✅ Sign-in success → navigate to home
        if (!mounted) return;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomePage()),
        );
      } else {
        //No session, show generic error
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Invalid login credentials")),
        );
      }
    } on AuthException catch (e) {
      // Supabase specific error (wrong email, password, unconfirmed email, etc.)
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: ${e.message}")));
    } catch (e) {
      // Other errors (network, server, etc.)
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Unexpected error: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            SizedBox(width: screenWidth * 0.3),
            Image(
              image: AssetImage('assets/images/logo_health.png'),
              height: 30,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: screenheight * 0.1),
                Text(
                  'Sign In',
                  style: GoogleFonts.outfit(
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

            SizedBox(height: 40),

            // This column is for the textfield
            Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 30),

                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: screenheight * 0.02),
                          Text(
                            'Email',
                            style: GoogleFonts.robotoMono(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFA7A6A5),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: screenWidth * 0.95,
                        child: TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: "patient@gmail.com",
                            filled: true,
                            fillColor: Color(0xFFEFF2F1),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF66CA98)),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          validator: validateemail,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 30),

                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: screenheight * 0.02),
                          Text(
                            'Password',
                            style: GoogleFonts.robotoMono(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFA7A6A5),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: screenWidth * 0.95,
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: _isObscure,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFEFF2F1),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                            ),
                          ),
                          validator: validatepassword,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 5),

                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {},

                          child: const Text(
                            'forget password?',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(
                                0xFF66CA98,
                              ), // Optional: style the text to look like a link
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // SizedBox(height: screenheight * 0.38),
                  Spacer(),

                  SizedBox(
                    width: screenWidth * 0.8,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _signInUser,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF66CA98),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Do not have account? ",
                        style: TextStyle(color: Color(0xFFA7A6A5)),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => UserSignUp()),
                          );
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Color(0xFF66CA98),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
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
