import 'package:tharwat_shop_app/constracts.dart';
import 'package:tharwat_shop_app/models/rating_model.dart';

class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String? image;
  final RatingModel? rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });
  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
        id: jsonData[kId],
        title: jsonData[kTitle],
        price: double.parse(jsonData[kPrice].toString()),
        description: jsonData[kDescription],
        category: jsonData[kCategory],
        image: jsonData[kImage],
        rating: jsonData[kRating] == null
            ? null
            : RatingModel.fromJson(jsonData[kRating]));
  }
}
