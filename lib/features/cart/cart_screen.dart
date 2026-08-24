import 'package:e_commerce/core/widgets/primary_button_widget.dart';
import 'package:e_commerce/features/cart/widgets/cart_item_widgets.dart';
import 'package:e_commerce/features/cart/widgets/total_price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("My Cart"),
        centerTitle: true,
        leading: Container(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Gap(14),
              const CartItemWidget(),
              const Gap(14),
              const CartItemWidget(),
              const Gap(100),
              const TotalPriceWidget(title: "Sub-total", price: "\$ 5,870"),
              const Gap(16),
              const TotalPriceWidget(title: "VAT (%)", price: "\$ 0.00"),
              const Gap(16),
              const TotalPriceWidget(title: "Shipping fee", price: "\$80"),
              const Gap(16),
              Divider(),
              const TotalPriceWidget(title: "Total", price: "\$ 5,950"),
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
      ),
    );
  }
}
