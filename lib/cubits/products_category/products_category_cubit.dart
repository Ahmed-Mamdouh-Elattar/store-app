import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/products_model.dart';
part 'products_category_state.dart';

class ProductsCategoryCubit extends Cubit<ProductsCategoryState> {
  ProductsCategoryCubit() : super(ProductsCategoryInitial());
  ProductsModel? productsCategory;
  final String _baseUrl = "https://dummyjson.com";
  getProductsCategory(String category) async {
    emit(ProductsCategoryLoading());
    try {
      Map<String, dynamic> productsJson = await Api().getWithQuery(
        path: "$_baseUrl/products/category/$category",
        queryParameters: {
          "select": "title,price,rating,category,thumbnail,description",
        },
      );
      productsCategory = ProductsModel.fromJson(productsJson);
      emit(ProductsCategorySuccess());
    } on Exception catch (e) {
      emit(ProductsCategoryFailuer(error: e.toString()));
    }
  }
}
