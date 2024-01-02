import 'package:flutter/material.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/core/style/app_colors.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/features/home/presentation/screens/home_screen.dart';

class BlogApp extends StatelessWidget {
  const BlogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
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
      ),
      home: const HomeScreen(),
    );
  }
}
