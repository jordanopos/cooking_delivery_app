// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

class ProductModel {
    ProductModel({
        required this.name,
        required this.image,
        required this.price,
        required this.type,
    });

    String name;
    String image;
    int price;
    String type;

    factory ProductModel.fromRawJson(String str) => ProductModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        name: json["name"],
        image: json["image"],
        price: json["price"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "price": price,
        "type": type,
    };
}
