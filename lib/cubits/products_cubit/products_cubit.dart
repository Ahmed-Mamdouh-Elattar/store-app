import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/products_model.dart';
part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());
  ProductsModel? products;
  final String _baseUrl = "https://dummyjson.com";
  getAllProducts() async {
    emit(ProductsLoading());
    try {
      Map<String, dynamic> productsJson = await Api().getWithQuery(
        path: "$_baseUrl/products",
        queryParameters: {
          "select": "title,price,rating,category,thumbnail,description",
          "limit": 200,
        },
      );
      products = ProductsModel.fromJson(productsJson);
      emit(ProductsSuccess());
    } on Exception catch (e) {
      emit(ProductsFailure(error: e.toString()));
    }
  }
}
