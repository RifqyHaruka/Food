// ignore_for_file: file_names

import 'dart:convert';

import 'package:foods/model/pizzaMode.dart';
import 'package:http/http.dart' as http;

class PizzaService {
  Future<List<PizzaModel>> getPizza() async {
    var url = Uri.parse('https://pizza-and-desserts.p.rapidapi.com/pizzas');
    var headers = {
      'x-rapidapi-host': 'pizza-and-desserts.p.rapidapi.com',
      'x-rapidapi-key': '' //Use Your Own API Key
    };
    var response = await http.get(url, headers: headers);

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      List<PizzaModel> pizzas = [];
      List parsedJson = jsonDecode(response.body);

      parsedJson.forEach((pizza) {
        pizzas.add(PizzaModel.fromJson(pizza));
      });

      return pizzas;
    }

    throw Exception('Salah di get Pizza Service');
  }
}
