import 'package:flutter/material.dart';
import 'package:islami_app/ui/caching/cache_helper.dart';
import 'package:islami_app/ui/utils/app_assets.dart';
import 'package:islami_app/ui/utils/app_colors.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;

  bool get isDarkThemeEnables => currentTheme == ThemeMode.dark;

  ThemeProvider() {
    loadThemeCaching();
  }

  set newTheme(ThemeMode themeMode) {
    currentTheme = themeMode;
    notifyListeners();
    CacheHelper.putBoolean(key: 'isDark', value: isDarkThemeEnables);
  }

  void loadThemeCaching() {
    bool isDark = CacheHelper.getBoolean(key: 'isDark') ?? false;
    currentTheme = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }


  String get mainBackground =>
      isDarkThemeEnables ? AppAssets.darkBackground : AppAssets.lightBackground;

  String get mainSplashBackground =>
      isDarkThemeEnables ? AppAssets.splashDark : AppAssets.splash;

  String get sebhaHead =>
      isDarkThemeEnables ? AppAssets.headOfDarkSebha : AppAssets.headOfSebha;

  String get sebhabody =>
      isDarkThemeEnables ? AppAssets.bodyOfDarkSebha : AppAssets.bodyOfSebha;

  Color get primaryColor =>
      isDarkThemeEnables ? AppColors.primaryDarkColor : AppColors.primaryColor;

  Color get containerColor =>
      isDarkThemeEnables ? AppColors.primaryDarkColor : AppColors.white;
  Color get containerSebhaColor =>
      isDarkThemeEnables ? AppColors.accentDarkColor : AppColors.primaryColor;
}
