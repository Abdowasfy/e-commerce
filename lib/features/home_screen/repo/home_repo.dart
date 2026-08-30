import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/networking/api_endpoints.dart';
import 'package:e_commerce/core/networking/api_helper.dart';
import 'package:e_commerce/features/home_screen/models/categories_model.dart';
import 'package:e_commerce/features/home_screen/models/products_model.dart';

class HomeRepo {
  final DioHelper _dioHelper;

  HomeRepo(this._dioHelper);

  // Get products
  Future<Either<String, List<ProductsModel>>> getProducts() async {
    try {
      final response = await _dioHelper.getRequest(
        endPoint: ApiEndpoints.products,
      );

      if (response.statusCode == 200) {
        final products = (response.data as List)
            .map((product) => ProductsModel.fromJson(product))
            .toList();

        return Right(products);
      } else {
        return Left('Something went wrong');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  // Get categories
  Future<Either<String, List<CategoriesModel>>> getCategories() async {
    try {
      final response = await _dioHelper.getRequest(
        endPoint: ApiEndpoints.categories,
      );

      if (response.statusCode == 200) {
        final categories = (response.data as List).map((category) => CategoriesModel.fromJson(category)).toList();
        

        return Right(categories);
      } else {
        return Left('Something went wrong');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  // Get products by category
  Future<Either<String, List<ProductsModel>>> getProductsByCategory(
    int categoryId,
  ) async {
    try {
      final response = await _dioHelper.getRequest(
        endPoint: '${ApiEndpoints.products}/?categoryId=$categoryId',
      );

      if (response.statusCode == 200) {
        final products = (response.data as List)
            .map((product) => ProductsModel.fromJson(product))
            .toList();

        return Right(products);
      } else {
        return Left('Something went wrong');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
