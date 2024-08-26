// To parse this JSON data, do
//
//     final productsModel = productsModelFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

ProductsModel productsModelFromJson(String str) =>
    ProductsModel.fromJson(json.decode(str));

String productsModelToJson(ProductsModel data) => json.encode(data.toJson());

class ProductsModel {
  final List<Product>? products;
  final int? total;
  final int? skip;
  final int? limit;

  ProductsModel({
    this.products,
    this.total,
    this.skip,
    this.limit,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        products: json["products"] == null || json["products"] == []
            ? []
            : List<Product>.from(
                json["products"]!.map((x) => Product.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
      };
}

class Product {
  final int? id;
  final String? title;
  final String? description;
  final Category? category;
  final double? price;
  final String? thumbnail;
  final double? rating;

  Product({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.thumbnail,
    this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        category: categoryValues.map[json["category"]]!,
        price: json["price"]?.toDouble(),
        thumbnail: json["thumbnail"],
        rating: json["rating"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "category": categoryValues.reverse[category],
        "price": price,
        "thumbnail": thumbnail,
        "rating": rating,
      };
}

enum Category {
  BEAUTY,
  FRAGRANCES,
  FURNITURE,
  GROCERIES,
  HOME_DECORATION,
  KITCHEN_ACCESSORIES,
  LAPTOPS,
  MENS_SHIRTS,
  MENS_SHOES,
  MENS_WATCHES,
  MOBILE_ACCESSORIES,
  MOTORCYCLE,
  SKIN_CARE,
  SMARTPHONES,
  SPORTS_ACCESSORIES,
  SUNGLASSES,
  TABLETS,
  TOPS,
  VEHICLE,
  WOMENS_BAGS,
  WOMENS_DRESSES,
  WOMENS_JEWELLERY,
  WOMENS_SHOES,
  WOMENS_WATCHES
}

final categoryValues = EnumValues({
  "beauty": Category.BEAUTY,
  "fragrances": Category.FRAGRANCES,
  "furniture": Category.FURNITURE,
  "groceries": Category.GROCERIES,
  "home-decoration": Category.HOME_DECORATION,
  "kitchen-accessories": Category.KITCHEN_ACCESSORIES,
  "laptops": Category.LAPTOPS,
  "mens-shirts": Category.MENS_SHIRTS,
  "mens-shoes": Category.MENS_SHOES,
  "mens-watches": Category.MENS_WATCHES,
  "mobile-accessories": Category.MOBILE_ACCESSORIES,
  "motorcycle": Category.MOTORCYCLE,
  "skin-care": Category.SKIN_CARE,
  "smartphones": Category.SMARTPHONES,
  "sports-accessories": Category.SPORTS_ACCESSORIES,
  "sunglasses": Category.SUNGLASSES,
  "tablets": Category.TABLETS,
  "tops": Category.TOPS,
  "vehicle": Category.VEHICLE,
  "womens-bags": Category.WOMENS_BAGS,
  "womens-dresses": Category.WOMENS_DRESSES,
  "womens-jewellery": Category.WOMENS_JEWELLERY,
  "womens-shoes": Category.WOMENS_SHOES,
  "womens-watches": Category.WOMENS_WATCHES,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
