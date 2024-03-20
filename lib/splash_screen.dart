import 'package:buy_once/data.dart';
import 'package:buy_once/default_layout.dart';
import 'package:buy_once/onboarding_screen.dart';
import 'package:buy_once/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkFirstOpen();
  }

  checkFirstOpen() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstOpen = prefs.getBool(IS_FIRST_OPEN) ?? true;
    prefs.setBool(IS_FIRST_OPEN, false);

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (_) =>
                isFirstOpen ? const OnboardingScreen() : const RootScreen()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        child: Column(
      children: [
        Image.asset('asset/img/logo.png'),
        const CircularProgressIndicator()
      ],
    ));
  }
}
