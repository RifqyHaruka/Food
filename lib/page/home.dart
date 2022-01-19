// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:foods/page/dessert.dart';
import 'package:foods/page/drink.dart';

import 'package:foods/page/pizza.dart';

import 'package:foods/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 30, right: 30, left: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => Detail()));
              },
              child: Image.asset(
                'assets/iconHeader1.png',
                width: 20,
                height: 15,
              ),
            ),
            Image.asset('assets/cartIcon.png', width: 20, height: 15)
          ],
        ),
      );
    }

    Widget search() {
      return Container(
        margin: EdgeInsets.only(top: 50, left: 30, right: 30),
        width: MediaQuery.of(context).size.width - 60,
        height: 50,
        decoration: BoxDecoration(
            color: border,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white)),
        child: Row(
          children: [
            Expanded(
                child: TextFormField(
              style: greyText.copyWith(fontSize: 20, color: grey),
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: greyText.copyWith(fontSize: 20, color: grey),
                contentPadding: EdgeInsets.only(bottom: 5, left: 20),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20)),
              ),
            )),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Image.asset(
                'assets/searchIcon.png',
                width: 15,
                height: 15,
              ),
            )
          ],
        ),

        // child: TextFormField(
        //   decoration: InputDecoration(
        //       filled: true,
        //       enabledBorder: OutlineInputBorder(
        //           borderRadius: BorderRadius.circular(20),
        //           borderSide: BorderSide.none),
        //       focusedBorder: OutlineInputBorder(
        //           borderRadius: BorderRadius.circular(20),
        //           borderSide: BorderSide(color: border)),
        //       border:
        //           OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        //       contentPadding: EdgeInsets.only(left: 28, bottom: 20, top: 20)),
        // ),
      );
    }

    Widget textTab() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.transparent),
              child: TabBar(
                unselectedLabelColor: grey,
                labelColor: green,
                labelStyle: greyText.copyWith(fontSize: 28),
                indicatorColor: green,
                tabs: [
                  Tab(text: 'Food'),
                  Tab(text: 'Dessert'),
                  Tab(text: 'Drink')
                ],
              ),
            ),
            Container(
              height: 500,
              child: TabBarView(children: [Pizza(), Dessert(), Drink()]),
            )
          ],
        ),
      );
    }

    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [header(), search(), textTab()],
            ),
          ),
        ),
      ),
    );
  }
}
