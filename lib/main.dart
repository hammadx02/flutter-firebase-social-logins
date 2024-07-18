import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:social_logins/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyC4RjwrgcMIyIKQUQc0O0-ZC4ynXp_PLWI',
      appId: '1:828472551678:android:32f28aca44d42d79569daf',
      messagingSenderId: '828472551678',
      projectId: 'social-logins-691ec',
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
