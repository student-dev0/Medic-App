import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:medic_clinic_app/models/validation_models.dart";

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
      body: SingleChildScrollView(scrollDirection: Axis.vertical,
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
                          validator: validateEmail,
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
                          validator: validatePassword,
                        ),
                      ),
                    ],
                  ),
        
                  SizedBox(height: 5),
        
                  Row( mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: screenWidth * 0.68),
                     
                      
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Forget your password?",
                                style: TextStyle(
                                  
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
        
                  SizedBox(height: screenheight * 0.42),
        
                  SizedBox(
                    width: screenWidth * 0.8,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // _agreetoTerms ? _signUpUser : null;
                      },
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
                            MaterialPageRoute(builder: (_) => UserSignIn()),
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
