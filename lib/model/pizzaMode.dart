// ignore_for_file: file_names

class PizzaModel {
  int? id;
  String? name;
  int? price;
  String? description;
  String? img;

  PizzaModel({this.id, this.name, this.price, this.description, this.img});

  PizzaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'img': img
    };
  }
}
