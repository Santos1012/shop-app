import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tharwat_shop_app/models/product_model.dart';
import 'package:tharwat_shop_app/pages/home_page.dart';
import 'package:tharwat_shop_app/pages/update_product_page.dart';


class ProductCard extends StatefulWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          UpdateProductPage.updatePageRoute,
          arguments: widget.product,
        );
      },
      child: Stack(
        children: [
          Positioned(
            top: 80,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 4,
              child: Container(
                padding: const EdgeInsetsDirectional.all(12),
                width: 165,
                height: 115,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      blurStyle: BlurStyle.normal,
                      spreadRadius: 2,
                      offset: const Offset(2, 10),
                      color: Colors.grey.shade200,
                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      // width: 100,
                      child: Wrap(
                        children: [
                          Text(
                            widget.product.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${widget.product.price.toString()}",
                        ),
                        InkWell(
                          onTap: () {
                            if (HomePage.favList.contains(widget.product.id)) {
                              HomePage.favList.remove(widget.product.id);
                            } else {
                              HomePage.favList.add(widget.product.id);
                            }
                            setState(() {
                              log("item id: ${widget.product.id} ");
                              log("item id: ${HomePage.favList}");
                            });
                          },
                          child: HomePage.favList.contains(widget.product.id)
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : const Icon(
                                  Icons.favorite,
                                  color: Colors.grey,
                                ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 50,
            top: 25,
            height: 100,
            child: Image.network(
              widget.product.image ??
                  "https://static.vecteezy.com/system/resources/thumbnails/022/014/063/small/missing-picture-page-for-website-design-or-mobile-app-design-no-image-available-icon-vector.jpg",
              fit: BoxFit.scaleDown,
              height: 100,
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}
