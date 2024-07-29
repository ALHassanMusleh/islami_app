import 'package:flutter/material.dart';
import 'package:islami_app/ui/utils/app_colors.dart';

abstract class AppStyles {
  static const TextStyle appBarStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: AppColors.accentColor,
  );
  static const TextStyle titleTextStyle = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w600,
    color: AppColors.accentColor,
  );

  static ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: AppColors.transparent,
    primaryColor: AppColors.primaryColor,
    appBarTheme: const AppBarTheme(
      foregroundColor: AppColors.accentColor,
      backgroundColor: AppColors.transparent,
      titleTextStyle: AppStyles.appBarStyle,
      elevation: 0,
      centerTitle: true,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.all<Color>(
        AppColors.primaryColor,
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: titleTextStyle,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.accentColor,
      unselectedItemColor: AppColors.white,
      selectedIconTheme: const IconThemeData(size: 38),
      unselectedIconTheme: const IconThemeData(size: 34),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: AppColors.transparent,
    primaryColor: AppColors.primaryDarkColor,
    appBarTheme: AppBarTheme(
      foregroundColor: AppColors.accentDarkColor,
      backgroundColor: AppColors.transparent,
      titleTextStyle: appBarStyle.copyWith(
        color: AppColors.white,
      ),
      elevation: 0,
      centerTitle: true,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.all<Color>(
        AppColors.accentDarkColor,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: titleTextStyle.copyWith(
        color: AppColors.white,
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.accentDarkColor,
      unselectedItemColor: AppColors.white,
      selectedIconTheme: const IconThemeData(size: 38),
      unselectedIconTheme: const IconThemeData(size: 34),
    ),
  );
}
