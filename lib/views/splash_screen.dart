import 'dart:async';
import 'package:flutter/material.dart';
import 'package:weather_app_v2/views/index_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 5),
        () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const IndexScreen()))
            });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff38C172),
      body: Center(
        child: Image.asset('assets/weather_logo.png'),
      ),
    );
  }
}
