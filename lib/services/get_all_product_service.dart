
import 'package:tharwat_shop_app/helpers/api.dart';
import 'package:tharwat_shop_app/models/product_model.dart';

class GetAllProductService {
  Future<List<ProductModel>> getAllProduct() async {
    List<dynamic> data =
        await Api().get(url: ("https://fakestoreapi.com/products"), token: null);

    List<ProductModel> productsList = [];
    for (var element in data) {
      productsList.add(
        ProductModel.fromJson(element),
      );
    }
    return productsList;
  }
}
