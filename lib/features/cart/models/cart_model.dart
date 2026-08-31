import 'package:e_commerce/features/home_screen/models/products_model.dart';

class CartModel {
  final ProductsModel product;
  int quantity;

  CartModel({required this.product, this.quantity = 1});
}
