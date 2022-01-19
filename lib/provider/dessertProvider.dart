// ignore_for_file: file_names
import 'package:flutter/cupertino.dart';
import 'package:foods/model/dessertModel..dart';
import 'package:foods/model/pizzaMode.dart';
import 'package:foods/service/dessertService.dart';

class DessertProvider with ChangeNotifier {
  List<PizzaModel> _desserts = [];

  List<PizzaModel> get desserts => _desserts;

  set desserts(List<PizzaModel> desserts) {
    _desserts = desserts;
    notifyListeners();
  }

  Future<void> getDesserts() async {
    try {
      List<PizzaModel> desserts = await DessertService().getDessert();
      _desserts = desserts;
    } catch (e) {
      print(e);
      print('Error di get Desserts Provider');
    }
  }
}
