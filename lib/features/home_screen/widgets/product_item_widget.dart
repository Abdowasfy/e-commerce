import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProductItemWidget extends StatelessWidget {
  final String title;
  final String price;
  final String image;
  final int id;
  final Function()? onTap;
  const ProductItemWidget({
    super.key,
    required this.title,
    required this.price,
    this.onTap,
    required this.image,
    required this.id,
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
              child: Hero(
                tag: "product$id",
                child: CachedNetworkImage(
                  width: 160.w,
                  height: 150.w,
                  imageUrl: image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Gap(8),
            Text(
              maxLines: 1,
              title,
              style: AppStyles.black15BoldStyle.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(3),
            Text("\$$price", style: AppStyles.grey12wMediumStyle),
          ],
        ),
      ),
    );
  }
}
