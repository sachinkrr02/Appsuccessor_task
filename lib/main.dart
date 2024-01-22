import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:soundescape/firebase_options.dart';
import 'package:soundescape/pages/onboarding/onboarding.dart';
// import 'dart:js';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      home: const OnBoardingScreen(),
    );
  }
}
