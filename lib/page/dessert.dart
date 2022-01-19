// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:foods/provider/dessertProvider.dart';
import 'package:foods/widget/foodCard.dart';
import 'package:provider/provider.dart';

import '../theme.dart';

class Dessert extends StatefulWidget {
  const Dessert({Key? key}) : super(key: key);

  @override
  _DessertState createState() => _DessertState();
}

class _DessertState extends State<Dessert> {
  // bool isLoading = false;
  // @override
  // void initState() {
  //   getDessert();
  //   super.initState();
  // }

  // getDessert() async {
  //   setState(() {
  //     isLoading = true;
  //   });

  //   await Provider.of<DessertProvider>(context, listen: false).getDesserts();

  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    var desserts = Provider.of<DessertProvider>(context);
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 30, left: 30, bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dessert\'s',
              style: blackText.copyWith(fontSize: 40),
            ),
            Column(
              children: desserts.desserts
                  .map((dessert) => FoodCard(
                        pizza: dessert,
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
