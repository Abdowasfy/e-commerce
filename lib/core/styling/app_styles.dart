import 'package:e_commerce/core/styling/app_colors.dart';
import 'package:e_commerce/core/styling/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyles {
  static TextStyle primaryMeadLineStyle = TextStyle(
    fontFamily: AppFonts.mainFontName,
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.balckColor,
  );

  static TextStyle subtitleStyle = TextStyle(
    fontFamily: AppFonts.mainFontName,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.secondaryColor,
  );

  static TextStyle black16w500style = TextStyle(
    fontFamily: AppFonts.mainFontName,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.balckColor,
  );

  static TextStyle grey12wMediumStyle = TextStyle(
    fontFamily: AppFonts.mainFontName,
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.greyColor,
  );

  static TextStyle black15BoldStyle = TextStyle(
    fontFamily: AppFonts.mainFontName,
    fontSize: 17.sp,
    fontWeight: FontWeight.bold,
    color: Color(0xff202955),
  );
  static TextStyle black18boldStyle = TextStyle(
    fontFamily: AppFonts.mainFontName,
    fontSize: 28.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.balckColor,
  );
}
