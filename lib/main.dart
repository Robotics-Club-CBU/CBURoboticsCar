import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import './screens/homepage.dart'; // Ensure this file contains the HomePage class
import './screens/batterypage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => AnimatedSplashScreen(
          splash: 'assets/splashscreen1.gif',
          splashIconSize: 2000.0,
          centered: true,
          nextScreen: OverviewScreen(),
          backgroundColor: Colors.black,
          duration: 3100,
        ),        
        '/battery': (context) => const BatteryManagementPage(),
      },
    );
  }
}