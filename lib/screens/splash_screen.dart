import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
     return AnimatedSplashScreen(
      splash: 'assets/logoText.png',
      nextScreen: const OnboardingScreen(),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}