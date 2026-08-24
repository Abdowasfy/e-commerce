import 'package:e_commerce/core/styling/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimayOutlinedButtonWidget extends StatelessWidget {
  final String? buttonText;
  final Color? bordersColor;
  final double? width;
  final double? height;
  final double? bordersRadius;
  final Color? textColor;
  final double? fontSize;
  final void Function()? onPress;
  const PrimayOutlinedButtonWidget({
    super.key,
    this.buttonText,
    this.bordersColor,
    this.width,
    this.height,
    this.bordersRadius,
    this.fontSize,
    this.textColor,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPress,
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: bordersColor ?? AppColors.primaryColor,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(bordersRadius ?? 8.r),
        ),
        fixedSize: Size(width ?? 331.w, height ?? 56.h),
      ),
      child: Text(
        buttonText ?? "",
        style: TextStyle(
          color: textColor ?? AppColors.primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: fontSize ?? 16.sp,
        ),
      ),
    );
  }
}
