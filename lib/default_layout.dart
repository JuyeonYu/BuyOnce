import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  AppBar? appBar;
  final Color backgroundColor;
  FloatingActionButton? floatingActionButton;
  Widget child;
  DefaultLayout(
      {required this.child,
      super.key,
      this.appBar,
      this.backgroundColor = Colors.white,
      this.floatingActionButton});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: backgroundColor,
      body: child,
    );
  }
}
