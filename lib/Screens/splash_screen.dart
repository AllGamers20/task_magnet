import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:taskmagnet/Screens/home.dart';

import 'package:page_transition/page_transition.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Home()),
      );
    });
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Image.asset(
            'Assets/Logo.png',
            width: 200,
            height: 200,
          )
        ],
      ),
      splashIconSize: 250,
      pageTransitionType: PageTransitionType.leftToRight,
      nextScreen: const Home(),
    );
  }
}
