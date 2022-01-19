// ignore_for_file: file_names
import 'dart:convert';

import 'package:foods/model/pizzaMode.dart';
import 'package:http/http.dart' as http;

class DessertService {
  Future<List<PizzaModel>> getDessert() async {
    var url = Uri.parse('https://pizza-and-desserts.p.rapidapi.com/desserts');
    var headers = {
      'x-rapidapi-host': 'pizza-and-desserts.p.rapidapi.com',
      'x-rapidapi-key': '' //Use Your Own API KEY
    };
    var response = await http.get(url, headers: headers);
    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      List<PizzaModel> desserts = [];
      List parsedJson = jsonDecode(response.body);

      parsedJson.forEach((dessert) {
        desserts.add(PizzaModel.fromJson(dessert));
      });

      return desserts;
    }
    throw Exception('Salah di get Dessert Service');
  }
}
