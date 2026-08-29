import 'package:e_commerce/features/home_screen/cubit/product_state.dart';
import 'package:e_commerce/features/home_screen/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._homeRepo) : super(ProductInitial());

  final HomeRepo _homeRepo;

  Future<void> fetchProducts() async {
    emit(ProductLoading());

    final res = await _homeRepo.getProducts();

    res.fold(
      (error) {
        emit(ProductError(error));
      },
      (right) {
        emit(ProductLoaded(right));
      },
    );
  }


  void fetchProductsByCategory(int cartName) async {
    emit(ProductLoading());

    final res = await _homeRepo.getProductsByCategory(cartName);

    res.fold(
      (error) {
        emit(ProductError(error));
      },
      (right) {
        emit(ProductLoaded(right));
      },
    );
  }
}
