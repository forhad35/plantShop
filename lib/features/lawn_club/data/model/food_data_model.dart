import 'dart:convert';

List<FoodItem> foodItemFromJson(String str) => List<FoodItem>.from(json.decode(str).map((x) => FoodItem.fromJson(x)));

String foodItemToJson(List<FoodItem> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FoodItem {
  String name;
  String description;
  String imageUrl;
  String veg;
  double rating;
  int ratingCount;
  int price;

  FoodItem({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.veg,
    required this.rating,
    required this.ratingCount,
    required this.price,
  });

  factory FoodItem.fromJson(Map<String, dynamic> json) => FoodItem(
    name: json["name"],
    description: json["description"],
    imageUrl: json["image_url"],
    veg: json["veg"],
    rating: json["rating"]?.toDouble(),
    ratingCount: json["rating_count"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "image_url": imageUrl,
    "veg": veg,
    "rating": rating,
    "rating_count": ratingCount,
    "price": price,
  };
}
