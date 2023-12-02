
import 'package:tharwat_shop_app/helpers/api.dart';
import 'package:tharwat_shop_app/models/product_model.dart';

class AddProduct {
  Future<ProductModel> addProduct({
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> data = await Api().post(
        url: "https://fakestoreapi.com/products",
        body: {
          "title": title,
          "price": price,
          "description": description,
          "image": image,
          "category": category,
        },
        token: null);
    return ProductModel.fromJson(data);
  }
}
