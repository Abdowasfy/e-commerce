import 'package:e_commerce/core/styling/app_colors.dart';
import 'package:e_commerce/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItemWidget extends StatelessWidget {
  final String categoryName;
  const CategoryItemWidget({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 8.w),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 7.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1.5),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Text(
          categoryName ,
          style: AppStyles.black15BoldStyle.copyWith(
            color: AppColors.balckColor,
          ),
        ),
      ),
    );
  }
}
