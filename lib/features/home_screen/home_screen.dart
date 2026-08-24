import 'package:e_commerce/core/routing/app_routes.dart';
import 'package:e_commerce/core/styling/app_colors.dart';
import 'package:e_commerce/core/styling/app_styles.dart';
import 'package:e_commerce/core/widgets/custom_text_field.dart';
import 'package:e_commerce/features/home_screen/widgets/category_item_widget.dart';
import 'package:e_commerce/features/home_screen/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(59),

          SizedBox(
            width: 335.w,
            child: Text("Discover", style: AppStyles.black18boldStyle),
          ),
          Gap(16),
          Row(
            children: [
              CustomTextField(width: 281.w, hintText: "Search for clothes..."),
              const Gap(8),
              Container(
                width: 52.w,
                height: 52.w,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: const Icon(Icons.tune, color: Colors.white),
              ),
            ],
          ),
          const Gap(16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CategoryItemWidget(categoryName: "All"),
                const Gap(8),
                CategoryItemWidget(categoryName: "Tshirts"),
                const Gap(8),
                CategoryItemWidget(categoryName: "Jeans"),
                const Gap(8),
                CategoryItemWidget(categoryName: "Shoes"),
                const Gap(8),
                CategoryItemWidget(categoryName: "Tshirts"),
                const Gap(8),
                CategoryItemWidget(categoryName: "Jeans"),
                const Gap(8),
              ],
            ),
          ),
          const Gap(16),
          Expanded(
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 16.0,
                childAspectRatio: 0.7,
              ),
              children: [
                ProductItemWidget(title: "Shoes", price: "\$1,190",onTap: () {
                  GoRouter.of(context).push(AppRoutes.productScreen);
                },),
                ProductItemWidget(title: "Shoes", price: "\$1,190"),
                ProductItemWidget(title: "Shoes", price: "\$1,190"),
                ProductItemWidget(title: "Shoes", price: "\$1,190"),
                ProductItemWidget(title: "Shoes", price: "\$1,190"),
                ProductItemWidget(title: "Shoes", price: "\$1,190"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
