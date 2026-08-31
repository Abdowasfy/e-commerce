import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/styling/app_styles.dart' show AppStyles;
import 'package:e_commerce/core/widgets/primary_button_widget.dart';
import 'package:e_commerce/features/cart/cubit/cart_cubit.dart';
import 'package:e_commerce/features/home_screen/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProductScreen extends StatelessWidget {
  final ProductsModel product;
  const ProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Details"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(20),
                  Container(
                    height: 341.h,
                    width: 341.w,
                    child: Hero(
                      tag: "product${product.id}",
                      child: CachedNetworkImage(
                        imageUrl: product.images.first,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Gap(12),
                  Text(
                    product.title,
                    style: AppStyles.black16w500style.copyWith(fontSize: 24.sp),
                  ),
                  const Gap(8),
                  Text(
                    product.slug,
                    style: AppStyles.black16w500style.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const Gap(4),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 18.sp),
                      const Gap(4),

                      const Gap(4),
                      Text(
                        "\$${product.price}",
                        style: AppStyles.black15BoldStyle.copyWith(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Gap(13),
                  Text(
                    product.description,
                    style: AppStyles.grey12wMediumStyle.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const Gap(150),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(
                left: 24.w,
                right: 24.w,
                top: 10.h,
                bottom: MediaQuery.of(context).padding.bottom + 16.h,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Price",
                            style: AppStyles.grey12wMediumStyle.copyWith(
                              fontSize: 16.sp,
                            ),
                          ),
                          const Gap(5),
                          Text(
                            "\$${product.price}",
                            style: AppStyles.black15BoldStyle.copyWith(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Gap(16),
                      PrimayButtonWidget(
                        icon: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                          size: 18.sp,
                        ),

                        onPress: () {
                          context.read<CartCubit>().addToCart(product);

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Added to cart")),
                          );
                        },

                        buttonText: "Add to Cart",
                        width: 240.w,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
