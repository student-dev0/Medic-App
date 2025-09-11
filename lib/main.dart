import 'package:flutter/material.dart';
import 'package:medic_clinic_app/screens/splash_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://tzhybzlromlgfrtnxgro.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR6aHliemxyb21sZ2ZydG54Z3JvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc0OTU5MzksImV4cCI6MjA3MzA3MTkzOX0.ZG3ZzLtSowH-oH8XrGbHTKeeM7Wu1tthcP9wNrtXJ5A',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
