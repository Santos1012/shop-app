
import 'package:tharwat_shop_app/helpers/api.dart';
import 'package:tharwat_shop_app/models/product_model.dart';

class UpdateProduct {
  Future<ProductModel> updateProduct({
    required int id,
    required String title,
    required double price,
    required String description,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> data = await Api().put(
      url: "https://fakestoreapi.com/products/$id",
      body: {
        "title": title,
        "price": price.toString(),
        "description": description,
        "image": image,
        "category": category,
      },
      token: null,
    );
    return ProductModel.fromJson(data);
  }
}
