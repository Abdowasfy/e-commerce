import 'package:e_commerce/core/styling/app_styles.dart' show AppStyles;
import 'package:e_commerce/core/widgets/primary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

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
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(8.w),
                    ),
                  ),
                  const Gap(12),
                  Text(
                    "Fit Polo T Shirt",
                    style: AppStyles.black16w500style.copyWith(fontSize: 24.sp),
                  ),
                  const Gap(12),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 18.sp),
                      const Gap(4),
                      Text(
                        "4.0/5",
                        style: AppStyles.black16w500style.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      const Gap(4),
                      Text(
                        "(45 reviews)",
                        style: AppStyles.grey12wMediumStyle.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Gap(13),
                  Text(
                    "Blue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of Them Good for All Men and Suits for All of ThemGood for All Men and Suits for All of ThemGood for All Men and Suits for All of Them",
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
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              color: Colors.white,
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
                          const Gap(8),
                          Text(
                            "\$1,190",
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
                        onPress: () {},
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
