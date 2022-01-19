// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foods/model/pizzaMode.dart';
import 'package:foods/page/home.dart';
import 'package:foods/provider/dessertProvider.dart';
import 'package:foods/provider/pizzaProvider.dart';
import 'package:foods/theme.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // Timer(Duration(seconds: 3), () {
    //   Navigator.pushAndRemoveUntil(
    //       context,
    //       MaterialPageRoute(builder: (context) => HomePage()),
    //       (route) => false);
    // });
    getPizza();
    super.initState();
  }

  getPizza() async {
    await Provider.of<PizzaProvider>(context, listen: false).getPizzas();
    await Provider.of<DessertProvider>(context, listen: false).getDesserts();
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/pizzaSplash.png',
              width: 100,
              height: 100,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'PiZzA SkuY',
              style: splashText.copyWith(color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
