// ignore_for_file: file_names

class DessertModel {
  int? id;
  int? price;
  String? name;
  String? description;
  String? img;

  DessertModel({this.id, this.name, this.description, this.img});

  DessertModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    img = json['img'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'img': img,
      'price': price
    };
  }
}
