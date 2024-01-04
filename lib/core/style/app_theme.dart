import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppTheme {
  static final defaultTheme = ThemeData(
    primarySwatch: MaterialColor(0xFF022E75, AppColors.colorSwatch),
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: Colors.grey.shade200,
    cardTheme: CardTheme(
      elevation: 4,
      color: Colors.white,
      shadowColor: AppColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.accentColor,
      foregroundColor: AppColors.primaryColor,
    ),
  );
}
