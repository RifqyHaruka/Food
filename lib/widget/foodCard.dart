// ignore_for_file: unused_import, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:foods/model/pizzaMode.dart';
import 'package:foods/page/detail.dart';
import 'package:foods/provider/detailProvider.dart';
import 'package:foods/theme.dart';
import 'package:provider/provider.dart';

class FoodCard extends StatefulWidget {
  final PizzaModel? pizza;

  FoodCard({this.pizza});
  @override
  _FoodCardState createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  @override
  Widget build(BuildContext context) {
    Widget plusButton() {
      return Align(
        alignment: Alignment.bottomRight,
        child: Container(
          margin: EdgeInsets.only(bottom: 15, right: 15),
          width: 36,
          height: 36,
          decoration: BoxDecoration(shape: BoxShape.circle, color: green),
          child: Align(
            alignment: Alignment.center,
            child: Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image:
                        DecorationImage(image: AssetImage('assets/plus.png')))),
          ),
        ),
      );
    }

    var details = Provider.of<DetailProvider>(context);
    return GestureDetector(
      onTap: () {
        details.quantity = 1;
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Detail(widget.pizza)));
      },
      child: Container(
        margin: EdgeInsets.only(top: 20),
        width: MediaQuery.of(context).size.width - 60,
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: border),
        child: Stack(children: [
          Row(
            children: [
              Container(
                  width: 70,
                  height: 70,
                  margin: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage('${widget.pizza!.img}')))),
              SizedBox(width: 18),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.pizza!.name}',
                        style: blackText.copyWith(fontSize: 20),
                      ),
                      Expanded(
                        child: Text(
                          '${widget.pizza!.description}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: greyText.copyWith(fontSize: 20),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '\$ ${widget.pizza!.price}',
                          style: blackText.copyWith(fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          plusButton()
        ]),
      ),
    );
  }
}
