import 'package:flutter/material.dart';
import 'package:foods/provider/pizzaProvider.dart';
import 'package:foods/widget/foodCard.dart';
import 'package:provider/provider.dart';

import '../theme.dart';

class Pizza extends StatefulWidget {
  const Pizza({Key? key}) : super(key: key);

  @override
  _PizzaState createState() => _PizzaState();
}

class _PizzaState extends State<Pizza> {
  @override
  Widget build(BuildContext context) {
    var pizza = Provider.of<PizzaProvider>(context);

    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 30, left: 30, bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pizza\'s',
              style: blackText.copyWith(fontSize: 40),
            ),
            Column(
              children: pizza.pizza
                  .map((pizza) => FoodCard(
                        pizza: pizza,
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
