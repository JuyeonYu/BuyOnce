import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  Widget child;
  DefaultLayout({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
    );
  }
}
