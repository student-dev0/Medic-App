import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic_clinic_app/models/validation_models.dart';
import 'package:medic_clinic_app/screens/User%20Authentication%20screens/user_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserSignUp extends StatefulWidget {
  const UserSignUp({super.key});

  @override
  State<UserSignUp> createState() => _UserSignUpState();
}

class _UserSignUpState extends State<UserSignUp> {
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscure = true;
  bool _agreetoTerms = false;

  final _formKey = GlobalKey<FormState>();

  Future<void> _signUpUser() async {
    if (_formKey.currentState!.validate()) {
      try {
        final response = await Supabase.instance.client.auth.signUp(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
          data: {'full_name': _fullnameController.text.trim()},
        );

        if (response.user != null) {
          // Successfully signed up
          //
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Account created! Please check your email."),
            ),
          );

          // Navigate to Sign In screen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const UserSignIn()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Signup failed. Try again.")),
          );
        }
      } on AuthException catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Error: ${e.message}")));
      } catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Unexpected error: $e")));
      }
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
                  'Sign Up',
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
                  Column(crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: screenheight * 0.02),
                          Text(
                            'Full Name',
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
                          controller: _fullnameController,
                          decoration: InputDecoration(
                            hintText: "Emmanuel Adesoye",
                            filled: true,
                            fillColor: Color(0xFFEFF2F1),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF66CA98)),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          validator: validatefullName,
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

                  Row(
                    children: [
                      SizedBox(width: screenWidth * 0.02),
                      Transform.scale(
                        scale: 1.3,
                        child: Checkbox(
                          checkColor: Colors.white,
                          focusColor: Color(0xFF66CA98),
                          activeColor: Color(0xFF66CA98),
                          value: _agreetoTerms,
                          onChanged: (value) {
                            setState(() {
                              _agreetoTerms = value ?? false;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "I agree with Terms and ",
                                style: TextStyle(
                                  color: Color(0xFFCDCFCE),
                                  fontSize: 16,
                                ),
                              ),
                              TextSpan(
                                text: "Privacy Policy",

                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Color(0xFF66CA98),
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: screenheight * 0.3),
                  // Spacer(),

                  SizedBox(
                    width: screenWidth * 0.8,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _agreetoTerms ? _signUpUser : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF66CA98),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        "Sign Up",
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
                        "Already have account? ",
                        style: TextStyle(color: Color(0xFFA7A6A5)),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => UserSignIn()),
                          );
                        },
                        child: const Text(
                          "Sign In",
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
