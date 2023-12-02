
import 'package:tharwat_shop_app/helpers/api.dart';

class AllCategories {
  Future<List> allCategoriesService() async {
    List<dynamic> data =
        await Api().get(url: ("https://fakestoreapi.com/products/categories"), token: null);

    return data;
  }
}
