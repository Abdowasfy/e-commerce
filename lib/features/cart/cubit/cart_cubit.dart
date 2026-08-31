import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/features/cart/models/cart_model.dart';
import 'package:e_commerce/features/home_screen/models/products_model.dart';

class CartCubit extends Cubit<List<CartModel>> {
  CartCubit() : super([]);

  void addToCart(ProductsModel product) {
    final existingIndex = state.indexWhere(
      (item) => item.product.id == product.id,
    );

    if (existingIndex != -1) {
      final updatedCart = List<CartModel>.from(state);

      updatedCart[existingIndex].quantity++;

      emit(updatedCart);
    } else {
      final updatedCart = List<CartModel>.from(state);

      updatedCart.add(
        CartModel(product: product),
      );

      emit(updatedCart);
    }
  }

  void removeFromCart(int productId) {
    final updatedCart = state
        .where((item) => item.product.id != productId)
        .toList();

    emit(updatedCart);
  }

  void increaseQuantity(int productId) {
    final updatedCart = List<CartModel>.from(state);

    final index = updatedCart.indexWhere(
      (item) => item.product.id == productId,
    );

    if (index != -1) {
      updatedCart[index].quantity++;
      emit(updatedCart);
    }
  }

  void decreaseQuantity(int productId) {
    final updatedCart = List<CartModel>.from(state);

    final index = updatedCart.indexWhere(
      (item) => item.product.id == productId,
    );

    if (index != -1) {
      if (updatedCart[index].quantity > 1) {
        updatedCart[index].quantity--;
      } else {
        updatedCart.removeAt(index);
      }

      emit(updatedCart);
    }
  }

  double get totalPrice {
    double total = 0;

    for (final item in state) {
      total += item.product.price * item.quantity;
    }

    return total;
  }
}
