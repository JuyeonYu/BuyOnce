import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final Color backgroundColor;
  FloatingActionButton? floatingActionButton;
  Widget child;
  DefaultLayout(
      {required this.child,
      super.key,
      this.backgroundColor = Colors.white,
      this.floatingActionButton});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingActionButton,

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: backgroundColor,
      body: child,
    );
  }
}
