import 'package:buy_once/default_layout.dart';
import 'package:buy_once/items_screen.dart';
import 'package:buy_once/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        child: SafeArea(
      child: IntroductionScreen(
        pages: [
          PageViewModel(
              title: 'test1',
              body: 'b1',
              image: const Center(
                child: Icon(
                  Icons.abc,
                  size: 50,
                ),
              ),
              decoration: getPageDecoration()),
          PageViewModel(
              title: 'test2',
              body: 'b2',
              image: const Center(
                child: Icon(
                  Icons.ac_unit_sharp,
                  size: 50,
                ),
              ),
              decoration: getPageDecoration()),
          PageViewModel(
              title: 'test3',
              body: 'b3',
              image: const Center(
                child: Icon(
                  Icons.access_time,
                  size: 50,
                ),
              ),
              decoration: getPageDecoration()),
        ],
        done: Text('go'),
        onDone: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const RootScreen()),
          );
        },
        showBackButton: false,
        showDoneButton: true,
        showNextButton: false,
        dotsDecorator: DotsDecorator(
            color: Colors.cyan,
            size: const Size(15, 15),
            activeSize: const Size(27, 15),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24))),
        curve: Curves.bounceOut,
      ),
    ));
  }

  PageDecoration getPageDecoration() {
    return const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 44, fontWeight: FontWeight.bold),
      bodyTextStyle: TextStyle(
        fontSize: 34,
        color: Colors.blue,
      ),
      imagePadding: EdgeInsets.only(top: 40),
    );
  }
}
