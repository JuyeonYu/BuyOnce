import 'package:buy_once/default_layout.dart';
import 'package:flutter/material.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        child: const Column(
      children: [Text('root')],
    ));
  }
}
