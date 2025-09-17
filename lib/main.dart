import 'package:flutter/material.dart';
import 'package:medic_clinic_app/screens/Profile%20User%20Screens/home_page.dart';
import 'package:medic_clinic_app/screens/splash_screen.dart';// <-- Add this import
import 'package:medic_clinic_app/screens/User Authentication screens/user_sign_in.dart'; // <-- Add this import
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://tzhybzlromlgfrtnxgro.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR6aHliemxyb21sZ2ZydG54Z3JvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc0OTU5MzksImV4cCI6MjA3MzA3MTkzOX0.ZG3ZzLtSowH-oH8XrGbHTKeeM7Wu1tthcP9wNrtXJ5A',
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _supabase = Supabase.instance.client;

  @override
  void initState() {
    super.initState();

    // Listen for auth state changes globally
    _supabase.auth.onAuthStateChange.listen((data) {
      final session = data.session;

      if (session != null) {
        //  Logged in → navigate to Home
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const HomePage()),
          (route) => false,
        );
      } else {
        // Logged out → back to SignIn
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const UserSignIn()),
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medic Clinic App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
