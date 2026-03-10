import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'screens/intro_screen.dart';
import 'screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const PublicSafetyApp());
}

class PublicSafetyApp extends StatelessWidget {
  const PublicSafetyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final user = FirebaseAuth.instance.currentUser;

    return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: user != null ? const HomeScreen() : const IntroScreen(),
    );


    }
}
