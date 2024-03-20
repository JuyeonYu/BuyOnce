import 'package:buy_once/default_layout.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        child: const Column(
      children: [Text('onboarding')],
    ));
  }
}
