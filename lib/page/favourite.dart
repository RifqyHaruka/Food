// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:foods/model/pizzaMode.dart';
import 'package:foods/provider/favProvider.dart';
import 'package:foods/theme.dart';
import 'package:foods/widget/foodCard.dart';
import 'package:provider/provider.dart';

class Favourite extends StatefulWidget {
  final PizzaModel? food;
  Favourite(this.food);
  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    var fav = Provider.of<FavProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/favIconSelect.png',
                    width: 24,
                    height: 24,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Favourite',
                    style: blackText.copyWith(fontSize: 40),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 500,
              margin: EdgeInsets.only(left: 30),
              child: ListView.builder(
                itemCount: fav.fav.length,
                itemBuilder: (context, i) {
                  return Dismissible(
                    background: Container(
                      color: Colors.red,
                      child: Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.delete, color: Colors.white),
                            Text('Hapus',
                                style: whiteText.copyWith(fontSize: 20)),
                          ],
                        ),
                      ),
                    ),
                    onDismissed: (DismissDirection direction) {
                      // if (direction == DismissDirection.startToEnd) {
                      //   print("Add to favorite");
                      // } else {
                      //   print('Remove item');
                      // }

                      setState(() {
                        // fav.fav.removeAt(i);
                        fav.setFav(widget.food as PizzaModel);
                      });
                    },
                    key: Key('${fav.fav[i]}'),
                    child: FoodCard(
                      pizza: widget.food,
                    ),
                  );
                },
              ),
              // child: Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: fav.fav
              //       .map((fav) => FoodCard(
              //             pizza: widget.food,
              //           ))
              //       .toList(),
              // ),
            )
          ],
        ),
      ),
    );
  }
}
