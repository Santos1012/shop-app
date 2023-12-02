import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tharwat_shop_app/models/product_model.dart';
import 'package:tharwat_shop_app/pages/home_page.dart';
import 'package:tharwat_shop_app/services/update_product_service.dart';
import 'package:tharwat_shop_app/widgets/custom_text_field_widget.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({super.key});
  static String updatePageRoute = "updatePageRoute";
  static TextEditingController productTitleController = TextEditingController();
  static TextEditingController productPriceController = TextEditingController();
  static TextEditingController productDescController = TextEditingController();

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    UpdateProductPage.productTitleController.text = product.title;
    UpdateProductPage.productDescController.text = product.description;
    UpdateProductPage.productPriceController.text = product.price.toString();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Product"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              CustomTextField(
                productTitleController:
                    UpdateProductPage.productTitleController,
                labelText: "Title",
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                productTitleController: UpdateProductPage.productDescController,
                labelText: "Description",
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                productTitleController:
                    UpdateProductPage.productPriceController,
                labelText: "Price",
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  try {
                    await updateProductFunction(product);
                    navigatorFunction(route: HomePage.homePageRoute);
                  } on HttpException catch (e) {
                    throw Exception(e);
                  } catch (e) {
                    log(e.toString());
                    throw Exception(e.toString());
                  }
                  setState(() {
                    isLoading = false;
                  });
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    fixedSize: const Size(200, 50)),
                child: isLoading == true
                    ? const CircularProgressIndicator()
                    : const Text("Update Product"),
              )
            ],
          ),
        ),
      ),
    );
  }

  void navigatorFunction({required String route}) {
    Navigator.pushReplacementNamed(context, HomePage.homePageRoute);
  }

  Future<void> updateProductFunction(ProductModel product) async {
    await UpdateProduct().updateProduct(
      id: product.id,
      title: UpdateProductPage.productTitleController.text,
      price: UpdateProductPage.productPriceController.text == ""
          ? product.price
          : double.parse(UpdateProductPage.productPriceController.text),
      description: UpdateProductPage.productDescController.text,
      image: product.image!,
      category: product.category,
    );
    // log(
    //   """title:${UpdateProductPage.productTitleController.text},
    //   price: ${UpdateProductPage.productPriceController.text == "" ? product.price : double.parse(UpdateProductPage.productPriceController.text)},
    //   description: ${UpdateProductPage.productDescController.text},
    //   image: ${product.image!},
    //   category: ${product.category},""",
    // );
  }
}
