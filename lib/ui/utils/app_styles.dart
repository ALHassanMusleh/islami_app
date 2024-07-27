import 'package:flutter/cupertino.dart';
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
}
