import 'package:flutter/material.dart';
import 'package:sahlah/config/themes/text_theme.dart';

import '../../../constants/app_colors.dart';

class AppElevatedButtonTheme {
  static ElevatedButtonThemeData elevatedButtonLightTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: AppTextTheme.darkTextTheme.labelLarge!.copyWith(
        fontSize: 10
      ),
      backgroundColor: AppColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
         15,
        ),
      ),
    ),
  );

  static ElevatedButtonThemeData elevatedButtonDarkTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: AppTextTheme.lightTextTheme.labelLarge!.copyWith(fontSize: 10),
      backgroundColor: AppColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
         15,
        ),
      ),
    ),
  );
}
