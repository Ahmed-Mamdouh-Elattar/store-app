import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/products_cubit/products_cubit.dart';
import 'package:store_app/models/products_model.dart';

import 'package:store_app/widgets/custom_products_item_list.dart';

class ProductsBody extends StatelessWidget {
  const ProductsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          List<Product> products =
              BlocProvider.of<ProductsCubit>(context).products!.products!;
          return Padding(
            padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
            child: CustomProductsItemList(products: products),
          );
        } else if (state is ProductsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductsFailure) {
          return Text(state.error);
        } else {
          return const Text("There is an error try again later");
        }
      },
    );
  }
}
