// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:foods/model/pizzaMode.dart';

class FavProvider with ChangeNotifier {
  List<PizzaModel> _fav = [];

  List<PizzaModel> get fav => _fav;

  set fav(List<PizzaModel> fav) {
    _fav = fav;
    notifyListeners();
  }

  setFav(PizzaModel food) {
    if (!isFav(food)) {
      _fav.add(food);
    } else {
      _fav.removeWhere((element) => element.id == food.id);
    }

    notifyListeners();
  }

  isFav(PizzaModel food) {
    if (_fav.indexWhere((element) => element.id == food.id) == -1) {
      return false;
    } else {
      return true;
    }
  }
}
