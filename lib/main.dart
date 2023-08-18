import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskmagnet/Constant/color.dart';
import 'package:taskmagnet/Screens/home.dart';
import 'package:taskmagnet/Screens/introduction_screen.dart';
import 'package:taskmagnet/Screens/splash_Screen.dart';

bool show = true;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final pref = await SharedPreferences.getInstance();
  show =  pref.getBool('onBording')?? true ;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: show? const Intro() : const Splash(),
      darkTheme: ThemeData(
        textTheme: GoogleFonts.nunitoTextTheme(Theme.of(context).textTheme),
        colorScheme: ColorScheme.fromSeed(
            seedColor: pcolor, brightness: Brightness.dark),
      ),
      themeMode: ThemeMode.system,
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoTextTheme(Theme.of(context).textTheme),
        colorScheme: ColorScheme.fromSeed(
            seedColor: pcolor, brightness: Brightness.light),
      ),
    );
  }
}
