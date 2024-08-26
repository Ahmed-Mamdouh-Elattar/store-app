import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/products_category/products_category_cubit.dart';
import 'package:store_app/models/products_model.dart';

import 'package:store_app/widgets/custom_category_item_list.dart';

import 'package:store_app/widgets/custom_products_item_list.dart';

class ProductsCategoryBody extends StatelessWidget {
  const ProductsCategoryBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomCategoryItemList(),
        Expanded(
          child: BlocBuilder<ProductsCategoryCubit, ProductsCategoryState>(
            builder: (context, state) {
              if (state is ProductsCategorySuccess) {
                List<Product> products =
                    BlocProvider.of<ProductsCategoryCubit>(context)
                        .productsCategory!
                        .products!;

                if (products.isNotEmpty) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 12, left: 12, right: 12),
                    child: CustomProductsItemList(products: products),
                  );
                } else {
                  return const Center(
                    child: Text("There is no products for this category"),
                  );
                }
              } else if (state is ProductsCategoryLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ProductsCategoryFailuer) {
                return Center(
                  child: Text(state.error),
                );
              } else {
                return const Center(
                  child: Text("there is an error try again later"),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
