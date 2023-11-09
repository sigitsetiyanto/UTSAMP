import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uts/auth/auth.dart';
import 'package:uts/auth/login_or_register.dart';
import 'package:uts/firebase_options.dart';
import 'package:uts/pages/home_pages.dart';
import 'package:uts/pages/profile_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
      routes: {
        '/login_register_page': (context) => const LoginOrRegister(),
        '/home_page': (context) => const HomePage(),
        '/profile_pages': (context) => const ProfilePages(),
      },
    );
  }
}
