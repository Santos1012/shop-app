
import 'package:tharwat_shop_app/helpers/api.dart';
import 'package:tharwat_shop_app/models/product_model.dart';

class CategoryService {
  Future<List<ProductModel>> getOneCategoryProducts(
      {required String categoryName}) async {
    List<dynamic> data = await Api()
        .get(url: "https://fakestoreapi.com/products/category/$categoryName", token: null);
    List<ProductModel> productsList = [];
    for (var element in data) {
      productsList.add(
        ProductModel.fromJson(element),
      );
    }
    return productsList;
  }
}
