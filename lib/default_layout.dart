import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final Color backgroundColor;
  Widget child;
  DefaultLayout(
      {required this.child, super.key, this.backgroundColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: child,
    );
  }
}
