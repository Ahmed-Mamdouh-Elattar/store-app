import 'package:flutter/material.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/widgets/custom_product_item.dart';

class CustomProductsItemList extends StatelessWidget {
  const CustomProductsItemList({
    super.key,
    required this.products,
  });

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return CustomProductItem(product: products[index]);
      },
    );
  }
}
