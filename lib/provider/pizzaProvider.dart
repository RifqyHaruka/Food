// ignore_for_file: file_names, prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:foods/model/pizzaMode.dart';
import 'package:foods/service/PizzaService.dart';

class PizzaProvider with ChangeNotifier {
  List<PizzaModel> _pizza = [];

  List<PizzaModel> get pizza => _pizza;

  set pizza(List<PizzaModel> pizza) {
    _pizza = pizza;
    notifyListeners();
  }

  Future<void> getPizzas() async {
    try {
      List<PizzaModel> pizza = await PizzaService().getPizza();
      _pizza = pizza;
    } catch (e) {
      print(e);
      print('Salah di Provider get Pizza');
    }
  }
}
