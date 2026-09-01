import 'package:e_commerce/core/widgets/primary_button_widget.dart';
import 'package:e_commerce/features/cart/cubit/cart_cubit.dart';
import 'package:e_commerce/features/cart/models/cart_model.dart';
import 'package:e_commerce/features/cart/widgets/cart_item_widgets.dart';
import 'package:e_commerce/features/cart/widgets/total_price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("My Cart", style: TextStyle(fontSize: 24)),
        centerTitle: true,
        leading: Container(),
      ),
      body: BlocBuilder<CartCubit, List<CartModel>>(
        builder: (context, cartItems) {
          if (cartItems.isEmpty) {
            return const Center(
              child: Text("Your cart is empty", style: TextStyle(fontSize: 18)),
            );
          }

          final cartCubit = context.read<CartCubit>();

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Gap(14),

                  ...cartItems.map((item) => CartItemWidget(cartItem: item)),

                  const Gap(70),

                  TotalPriceWidget(
                    title: "Sub-total",
                    price: "\$ ${cartCubit.totalPrice.toStringAsFixed(2)}",
                  ),

                  const Gap(16),

                  const TotalPriceWidget(title: "VAT (%)", price: "\$ 0.00"),

                  const Gap(16),

                  const TotalPriceWidget(
                    title: "Shipping fee",
                    price: "\$ 80.00",
                  ),

                  const Gap(16),

                  const Divider(),

                  TotalPriceWidget(
                    title: "Total",
                    price:
                        "\$ ${(cartCubit.totalPrice + 80).toStringAsFixed(2)}",
                  ),

                  const Gap(51),

                  PrimayButtonWidget(
                    buttonText: "Go To Checkout",
                    trailingIcon: Icon(
                      Icons.payment,
                      color: Colors.white,
                      size: 16.sp,
                    ),
                    onPress: () {},
                  ),

                  const Gap(16),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
