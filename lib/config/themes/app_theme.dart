import 'package:flutter/material.dart';
import 'package:sahlah/config/themes/text_theme.dart';
import 'elevated_button_theme.dart';

class AppTheme {
  static ThemeData getApplicationLightTheme() {
    return ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        textTheme: AppTextTheme.lightTextTheme,
        elevatedButtonTheme: AppElevatedButtonTheme.elevatedButtonLightTheme);
  }

  static ThemeData getApplicationDarkTheme() {
    return ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        textTheme: AppTextTheme.darkTextTheme,
        elevatedButtonTheme: AppElevatedButtonTheme.elevatedButtonDarkTheme);
  }
}
