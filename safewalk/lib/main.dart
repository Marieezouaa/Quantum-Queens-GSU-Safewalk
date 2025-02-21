// main.dart - Entry point for the SafeWalk app
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tempsafewalk/pages/home_page/home_page.dart'; // Ensure SafeWalkHome is in home_page.dart
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:tempsafewalk/pages/create_and_login/login_page.dart';
import 'package:tempsafewalk/pages/menu/pages/settings_pages.dart';
import 'package:tempsafewalk/pages/menu/pages/friends_page.dart';
import 'package:tempsafewalk/pages/menu/pages/inbox.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const SafeWalkApp());
}

class SafeWalkApp extends StatelessWidget {
  const SafeWalkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
    );
  }
}

class AuthGate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const HomePage(); // ✅ SafeWalkHome is properly imported
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
