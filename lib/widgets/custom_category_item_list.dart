import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/products_category/products_category_cubit.dart';
import 'package:store_app/models/product_category_model.dart';

import 'package:store_app/widgets/custom_category_item.dart';

class CustomCategoryItemList extends StatefulWidget {
  const CustomCategoryItemList({
    super.key,
  });

  @override
  State<CustomCategoryItemList> createState() => _CustomCategoryItemListState();
}

class _CustomCategoryItemListState extends State<CustomCategoryItemList> {
  final List<ProductCategoryModel> categories = const [
    ProductCategoryModel(apiName: "beauty", displayName: "Beauty"),
    ProductCategoryModel(apiName: "fragrances", displayName: "Fragrances"),
    ProductCategoryModel(apiName: "furniture", displayName: "Furniture"),
    ProductCategoryModel(apiName: "groceries", displayName: "Groceries"),
    ProductCategoryModel(
        apiName: "home-decoration", displayName: "Home Decoration"),
    ProductCategoryModel(
        apiName: "kitchen-accessories", displayName: "Kitchen Accessories"),
    ProductCategoryModel(apiName: "laptops", displayName: "Laptops"),
    ProductCategoryModel(apiName: "mens-shirts", displayName: "Men's Shirts"),
    ProductCategoryModel(apiName: "mens-shoes", displayName: "Men's Shoes"),
    ProductCategoryModel(apiName: "mens-watches", displayName: "Men's Watches"),
    ProductCategoryModel(
        apiName: "mobile-accessories", displayName: "Mobile Accessories"),
    ProductCategoryModel(apiName: "motorcycle", displayName: "Motorcycle"),
    ProductCategoryModel(apiName: "skin-care", displayName: "Skin Care"),
    ProductCategoryModel(apiName: "smartphones", displayName: "Smartphones"),
    ProductCategoryModel(
        apiName: "sports-accessories", displayName: "Sports Accessories"),
    ProductCategoryModel(apiName: "sunglasses", displayName: "Sunglasses"),
    ProductCategoryModel(apiName: "tablets", displayName: "Tablets"),
    ProductCategoryModel(apiName: "tops", displayName: "Tops"),
    ProductCategoryModel(apiName: "vehicle", displayName: "Vehicle"),
    ProductCategoryModel(apiName: "womens-bags", displayName: "Women's Bags"),
    ProductCategoryModel(
        apiName: "womens-dresses", displayName: "Women's Dresses"),
    ProductCategoryModel(
        apiName: "womens-jewellery", displayName: "Women's Jewellery"),
    ProductCategoryModel(apiName: "womens-shoes", displayName: "Women's Shoes"),
    ProductCategoryModel(
        apiName: "womens-watches", displayName: "Women's Watches"),
  ];
  bool isChoosed = false;
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 0.2,
      child: ListView.builder(
          itemCount: 20,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 8, top: 8),
              child: currentIndex == index
                  ? CustomCategoryItem(
                      categoryName: categories[index].displayName,
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      showColor: true,
                    )
                  : CustomCategoryItem(
                      categoryName: categories[index].displayName,
                      onTap: () {
                        BlocProvider.of<ProductsCategoryCubit>(context)
                            .getProductsCategory(categories[index].apiName);
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      showColor: false,
                    ),
            );
          }),
    );
  }
}
