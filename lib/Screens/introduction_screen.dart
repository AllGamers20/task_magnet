import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskmagnet/Constant/color.dart';
import 'package:taskmagnet/Screens/home.dart';
import 'package:taskmagnet/Screens/splash_screen.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  final List<PageViewModel> pages = [
    PageViewModel(
      decoration: const PageDecoration(
        imagePadding: EdgeInsets.all(8.0),
        bodyTextStyle: TextStyle(
          fontSize: 30,
        ),
      ),
      body: 'TaskMagnet',
      title: 'Welcome User To',
      image: Image.asset(
        'Assets/welcome.gif',
        width: 110,
        height: 110,
      ),
    ),
    PageViewModel(
      body: 'Use this app to make your day better',
      title: 'App Usage',
      image: Image.asset(
        'Assets/list.gif',
        width: 110,
        height: 110,
      ),
    ),
    PageViewModel(
      body: 'dont forget to rate my first published app on playstore',
      title: 'Last Wish',
      image: Image.asset(
        'Assets/like.gif',
        width: 110,
        height: 110,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      showNextButton: false,
      onDone: () async {
        final pref = await SharedPreferences.getInstance();
        await pref.setBool('onBording', false);
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) {
            return const Splash();
          },
        ));
      },
      done: const Icon(
        Icons.arrow_right_alt,
        size: 25,
        color: pcolor,
      ),
      pages: pages,
      dotsDecorator: const DotsDecorator(
        color: pcolor,
        activeColor: bgcolor,
        activeSize: Size(15, 15),
      ),
    );
  }
}
