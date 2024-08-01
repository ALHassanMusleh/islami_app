import 'package:flutter/material.dart';
import 'package:islami_app/ui/caching/cache_helper.dart';

class FontSizeProvider extends ChangeNotifier {
  double selectedFontSize = 10.0;

  set setFontSize(double fontSize) {
    selectedFontSize = fontSize;
    notifyListeners();
    CacheHelper.putDouble(key: 'selectedFontSize', value: selectedFontSize);
  }

  FontSizeProvider() {
    loadFontSizeCaching();
  }

  void loadFontSizeCaching() {
    double fontSize = CacheHelper.getDouble(key: 'selectedFontSize') ?? 20.0;
    selectedFontSize = fontSize;
    notifyListeners();
  }
}
