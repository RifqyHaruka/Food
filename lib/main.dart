// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:foods/provider/dessertProvider.dart';
import 'package:foods/provider/detailProvider.dart';
import 'package:foods/provider/favProvider.dart';
import 'package:foods/provider/pizzaProvider.dart';
import 'package:foods/splash.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PizzaProvider()),
        ChangeNotifierProvider(create: (context) => DetailProvider()),
        ChangeNotifierProvider(create: (context) => DessertProvider()),
        ChangeNotifierProvider(create: (context) => FavProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
        },
      ),
    );
  }
}
