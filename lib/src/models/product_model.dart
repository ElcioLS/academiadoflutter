import 'dart:convert';

class ProductModel {
  final int? id;
  final String name;
  final String decription;
  final double price;
  final String image;
  final bool enabled;

  ProductModel({
    this.id,
    required this.name,
    required this.decription,
    required this.price,
    required this.image,
    required this.enabled,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'decription': decription,
      'price': price,
      'image': image,
      'enabled': enabled,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id']?.toInt(),
      name: map['name'] ?? '',
      decription: map['decription'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      image: map['image'] ?? '',
      enabled: map['enabled'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));
}
