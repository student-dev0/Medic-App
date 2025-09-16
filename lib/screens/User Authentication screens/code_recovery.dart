// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import "package:medic_clinic_app/Dashboard%20screens/home_page.dart";

// import 'dart:async';

// class CodeRecovery extends StatefulWidget {
//   const CodeRecovery({super.key});

//   @override
//   State<CodeRecovery> createState() => _CodeRecoveryState();
// }

// class _CodeRecoveryState extends State<CodeRecovery> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }

// class PasswordRecoveryScreen extends StatefulWidget {
//   final String email; // Pass the verified email when opening this screen

//   const PasswordRecoveryScreen({super.key, required this.email});

//   @override
//   State<PasswordRecoveryScreen> createState() => _PasswordRecoveryScreenState();
// }

// class _PasswordRecoveryScreenState extends State<PasswordRecoveryScreen> {
//   final TextEditingController _codeController = TextEditingController();
//   bool _isLoading = false;
//   int _seconds = 120; // 2 minutes
//   Timer? _timer;

//   @override
//   void initState() {
//     super.initState();
//     _sendCode(); // send first code when screen loads
//     _startTimer();
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     _codeController.dispose();
//     super.dispose();
//   }

//   /// Send OTP Code to email
//   Future<void> _sendCode() async {
//     try {
//       await Supabase.instance.client.auth.signInWithOtp(
//         email: widget.email,
//         emailRedirectTo: 'io.supabase.flutterdemo://login-callback/',
//       );
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("A code has been sent to your email")),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(SnackBar(content: Text(" Error: $e")));
//     }
//   }

//   /// Verify OTP entered by user
//   Future<void> _verifyCode() async {
//     setState(() => _isLoading = true);
//     try {
//       final response = await Supabase.instance.client.auth.verifyOtp(
//         type: OtpType.email,
//         token: _codeController.text.trim(),
//         email: widget.email,
//       );

//       if (response.session != null) {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (_) => const HomePage()),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text("Invalid or expired code")),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(SnackBar(content: Text("Error: $e")));
//     } finally {
//       setState(() => _isLoading = false);
//     }
//   }

//   /// Start the 2-minute timer
//   void _startTimer() {
//     _seconds = 120;
//     _timer?.cancel();
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
//       if (_seconds == 0) {
//         timer.cancel();
//         await _sendCode(); // resend new code
//         _startTimer(); // restart timer
//       } else {
//         setState(() => _seconds--);
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {

//      double screenWidth = MediaQuery.of(context).size.width;
//     // double screenheight = MediaQuery.of(context).size.height;

//     return Scaffold(
//      backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Row(
//           children: [
//             SizedBox(width: screenWidth * 0.3),
//             Image(
//               image: AssetImage('assets/images/logo_health.png'),
//               height: 30,
//             ),
//           ],
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _codeController,
//               decoration: const InputDecoration(
//                 labelText: "Enter the code from your email",
//               ),
//               keyboardType: TextInputType.number,
//             ),
//             const SizedBox(height: 12),
//             Text(
//               "Resending in ${_seconds ~/ 60}:${(_seconds % 60).toString().padLeft(2, '0')}",
//               style: const TextStyle(color: Colors.red, fontSize: 16),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _isLoading ? null : _verifyCode,
//               child: _isLoading
//                   ? const CircularProgressIndicator(color: Colors.white)
//                   : const Text("Verify"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
