import 'package:flutter/material.dart';
import 'package:tharwat_shop_app/models/product_model.dart';
import 'package:tharwat_shop_app/services/get_all_product_service.dart';
import 'package:tharwat_shop_app/widgets/product_card_widget.dart';

class FutureGridViewBuilder extends StatelessWidget {
  final BuildContext context;

  const FutureGridViewBuilder({super.key, required this.context});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
      future: GetAllProductService().getAllProduct(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ProductModel> homeProductslist = snapshot.data!;
          return Center(
            child: GridView.builder(
              padding: const EdgeInsets.only(left: 20, top: 30),
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0,
                childAspectRatio: .9,
                mainAxisSpacing: 0,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  product: homeProductslist[index],
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Oops there is an error, try again later"),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
