
import 'package:tharwat_shop_app/constracts.dart';

class RatingModel {
  final num rate;
  final int count;

  RatingModel({
    required this.rate,
    required this.count,
  });
  factory RatingModel.fromJson(jsonData) {
    return RatingModel(
      rate: jsonData[kRate],
      count: jsonData[kCount],
    );
  }
}
