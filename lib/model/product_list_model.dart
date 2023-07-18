// To parse this JSON data, do
//
//     final productList = productListFromJson(jsonString);

import 'dart:convert';

List<ProductList> productListFromJson(String str) => List<ProductList>.from(
    json.decode(str).map((x) => ProductList.fromJson(x)));

String productListToJson(List<ProductList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductList {
  ProductList({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.like,
    this.image,
    this.rating,
  });

  int? id;
  String? title;
  double? price;
  bool? like;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        category: json["category"],
        image: json["image"],
        like: false,
        rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
        "rating": rating?.toJson(),
      };
}

class Rating {
  Rating({
    this.rate,
    this.count,
  });

  double? rate;
  int? count;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"]?.toDouble(),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
      };
}
