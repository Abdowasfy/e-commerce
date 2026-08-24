import 'package:e_commerce/core/styling/app_colors.dart';
import 'package:e_commerce/core/styling/app_fonts.dart';
import 'package:e_commerce/core/styling/app_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    fontFamily: AppFonts.mainFontName,
    textTheme: TextTheme(
      titleLarge: AppStyles.primaryMeadLineStyle,
      titleMedium: AppStyles.subtitleStyle,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.primaryColor,
      disabledColor: AppColors.secondaryColor,
    ),
  );
}
 