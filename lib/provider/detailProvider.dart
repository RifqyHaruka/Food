// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';

class DetailProvider with ChangeNotifier {
  int _quantity = 1;

  int get quantity => _quantity;

  set quantity(int quantity) {
    if (quantity < 1) {
      quantity = 1;
      _quantity = quantity;
      notifyListeners();
    }
    _quantity = quantity;

    notifyListeners();
  }

  int? _price;

  int get price => _price as int;

  set price(int price) {
    _price = price;
  }
}
