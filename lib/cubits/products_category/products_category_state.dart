part of 'products_category_cubit.dart';

sealed class ProductsCategoryState {}

final class ProductsCategoryInitial extends ProductsCategoryState {}

final class ProductsCategoryLoading extends ProductsCategoryState {}

final class ProductsCategorySuccess extends ProductsCategoryState {}

final class ProductsCategoryFailuer extends ProductsCategoryState {
  final String error;

  ProductsCategoryFailuer({required this.error});
}
