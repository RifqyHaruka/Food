// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:foods/model/pizzaMode.dart';
import 'package:foods/page/favourite.dart';
import 'package:foods/provider/detailProvider.dart';
import 'package:foods/provider/favProvider.dart';
import 'package:foods/theme.dart';
import 'package:provider/provider.dart';

class Detail extends StatefulWidget {
  final PizzaModel? food;

  Detail(this.food);
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isChooseS = true;
  bool isChooseM = false;
  bool isChooseL = false;
  bool isFav = false;

  @override
  void initState() {
    Provider.of<DetailProvider>(context, listen: false).price =
        widget.food!.price as int;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var details = Provider.of<DetailProvider>(context);
    var fav = Provider.of<FavProvider>(context);

    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 30, left: 30, right: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                'assets/leftArrow.png',
                width: 24,
                height: 24,
              ),
            ),
            GestureDetector(
              onTap: () {
                _scaffoldKey.currentState!.openEndDrawer();
              },
              child: Image.asset(
                'assets/pilihanIcon.png',
                width: 4,
                height: 16,
              ),
            )
          ],
        ),
      );
    }

    Widget detail() {
      return Container(
        margin: EdgeInsets.only(top: 10, left: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${widget.food!.name}',
              style: blackText.copyWith(fontSize: 40),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              'Our very own! Smashed \nbeef burgers',
              style: greyText.copyWith(fontSize: 28),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 60,
              height: 216,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage('${widget.food!.img}'),
                      fit: BoxFit.cover)),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.only(top: 50, left: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Size', style: blackText.copyWith(fontSize: 26)),
            SizedBox(
              height: 4,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isChooseS = true;
                      isChooseL = false;
                      isChooseM = false;
                      if (isChooseS == true) {
                        details.price = widget.food!.price! * details.quantity;
                      }
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 20),
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        color: (isChooseS == true) ? green : border,
                        shape: BoxShape.circle),
                    child: Center(
                        child: Text(
                      'S',
                      style: (isChooseS == true)
                          ? whiteText.copyWith(fontSize: 30)
                          : blackText.copyWith(fontSize: 30),
                    )),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isChooseM = !isChooseM;
                      isChooseL = false;
                      isChooseS = false;
                      if (isChooseM == true) {
                        details.price = widget.food!.price as int;
                        details.price = (details.price + 10) * details.quantity;
                        // details.price = widget.food!.price! * details.quantity;
                      }
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 20),
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        color: (isChooseM == true) ? green : border,
                        shape: BoxShape.circle),
                    child: Center(
                        child: Text(
                      'M',
                      style: (isChooseM == true)
                          ? whiteText.copyWith(fontSize: 30)
                          : blackText.copyWith(fontSize: 30),
                    )),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isChooseL = !isChooseL;
                      isChooseS = false;
                      isChooseM = false;
                      if (isChooseL == true) {
                        details.price = widget.food!.price as int;
                        details.price = (details.price + 20) * details.quantity;
                      }
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 20),
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        color: (isChooseL == true) ? green : border,
                        shape: BoxShape.circle),
                    child: Center(
                        child: Text(
                      'L',
                      style: (isChooseL == true)
                          ? whiteText.copyWith(fontSize: 30)
                          : blackText.copyWith(fontSize: 30),
                    )),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            (isChooseM == true)
                ? Text(
                    '* Biaya Size M dikenakan tambahan \$10',
                    style: greyText.copyWith(fontSize: 28),
                  )
                : (isChooseL == true)
                    ? Text('* Biaya Size L dikenakan tambahan \$20',
                        style: greyText.copyWith(fontSize: 28))
                    : Container(),
            SizedBox(
              height: 10,
            ),
            Text('Quantity', style: blackText.copyWith(fontSize: 26)),
            SizedBox(
              height: 4,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    details.quantity = details.quantity - 1;
                    details.price = widget.food!.price! * details.quantity;
                    // if (isChooseS == true) {
                    //   details.price = widget.food!.price! * details.quantity;
                    // } else if (isChooseM == true) {
                    //   details.price =
                    //       (widget.food!.price! + 10) * details.quantity;
                    // } else if (isChooseL == true) {
                    //   details.price =
                    //       (widget.food!.price! + 20) * details.quantity;
                    // }
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 16),
                    width: 35,
                    height: 35,
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, color: grey),
                    child: Center(
                        child: Image.asset(
                      'assets/minusIcon.png',
                      width: 20,
                      height: 20,
                      fit: BoxFit.cover,
                    )),
                  ),
                ),
                Container(
                    child: Text(
                  details.quantity.toString(),
                  style: blackText.copyWith(fontSize: 30),
                )),
                GestureDetector(
                  onTap: () {
                    details.quantity = details.quantity + 1;
                    if (isChooseS == true) {
                      details.price = widget.food!.price! * details.quantity;
                    } else if (isChooseM == true) {
                      details.price =
                          (widget.food!.price! + 10) * details.quantity;
                    } else if (isChooseL == true) {
                      details.price =
                          (widget.food!.price! + 20) * details.quantity;
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 16),
                    width: 35,
                    height: 35,
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, color: green),
                    child: Center(
                        child: Image.asset(
                      'assets/plus.png',
                      width: 20,
                      height: 20,
                      fit: BoxFit.cover,
                    )),
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }

    Widget price() {
      return Container(
        margin: EdgeInsets.only(top: 30, bottom: 30, left: 30, right: 30),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Price', style: greyText.copyWith(fontSize: 26)),
                Text(
                  '\$ ${details.price}',
                  style: blackText.copyWith(fontSize: 26),
                )
              ],
            ),
            SizedBox(
              width: 69,
            ),
            GestureDetector(
              onTap: () {
                fav.setFav(widget.food as PizzaModel);
                if (fav.isFav(widget.food as PizzaModel)) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                    'Ditambahkan ke Favorite',
                    textAlign: TextAlign.center,
                  )));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                    'Dihapus dari Favorite',
                    textAlign: TextAlign.center,
                  )));
                }
              },
              child: Container(
                width: 60,
                height: 60,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: border),
                child: Center(
                  child: Image.asset(
                    (fav.isFav(widget.food as PizzaModel))
                        ? 'assets/favIconSelect.png'
                        : 'assets/favIcon.png',
                    width: 20,
                    height: 20,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(shape: BoxShape.circle, color: green),
              child: Center(
                child: Image.asset(
                  'assets/cartIcon.png',
                  color: white,
                  width: 20,
                  height: 20,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        endDrawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: grey),
                child: Text(
                  'Ini Menu',
                  style: splashText.copyWith(color: white),
                ),
              ),
              ListTile(
                leading: Image.asset(
                  'assets/favIconSelect.png',
                  width: 24,
                  height: 24,
                ),
                title: Text(
                  'Favourite',
                  style: blackText.copyWith(fontSize: 32),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Favourite(widget.food)));
                },
              ),
              ListTile(
                leading: Image.asset(
                  'assets/cartIcon.png',
                  color: green,
                  width: 24,
                  height: 24,
                ),
                title: Text(
                  'Cart',
                  style: blackText.copyWith(fontSize: 32),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Favourite(widget.food)));
                },
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(child: header()),
              detail(),
              content(),
              price(),
            ],
          ),
        ),
      ),
    );
  }
}
