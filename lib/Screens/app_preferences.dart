import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static const String keySplashSeen = 'splash_seen';
  static const String keyOnboardingSeen = 'onboarding_seen';

  static Future<bool> getSplashSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(keySplashSeen) ?? false;
  }

  static Future<void> setSplashSeen(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(keySplashSeen, value);
  }

  static Future<bool> getOnboardingSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(keyOnboardingSeen) ?? false;
  }

  static Future<void> setOnboardingSeen(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(keyOnboardingSeen, value);
  }
}
