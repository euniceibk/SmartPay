import 'package:flutter/material.dart';
import 'package:smart_pay_app/data/app_colors.dart';
import 'package:smart_pay_app/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartPay App',
      theme: ThemeData(scaffoldBackgroundColor: AppColors.white),
      home: const SplashScreen(),
    );
  }
}

