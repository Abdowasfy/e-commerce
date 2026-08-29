import 'package:e_commerce/features/home_screen/models/categories_model.dart';

abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesLoaded extends CategoriesState {
  final List<CategoriesModel> categories;

  CategoriesLoaded(this.categories);
}

class CategoriesError extends CategoriesState {
  final String error;

  CategoriesError(this.error);
}