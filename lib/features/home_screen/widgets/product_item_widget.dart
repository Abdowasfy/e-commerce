import 'package:e_commerce/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProductItemWidget extends StatelessWidget {
  final String title;
  final String price;
  final Function()? onTap;
  const ProductItemWidget({
    super.key,
    required this.title,
    required this.price,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Container(width: 160.w, height: 150.w, color: Colors.grey),
            ),
            const Gap(8),
            Text(
              title,
              style: AppStyles.black15BoldStyle.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(3),
            Text(price, style: AppStyles.grey12wMediumStyle),
          ],
        ),
      ),
    );
  }
}
