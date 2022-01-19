import 'package:flutter/material.dart';
import 'package:foods/theme.dart';

class Drink extends StatelessWidget {
  const Drink({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text('COMING SOON',
              textAlign: TextAlign.center,
              style: blackText.copyWith(fontSize: 100))),
    );
  }
}
