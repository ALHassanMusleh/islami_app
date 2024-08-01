import 'package:flutter/material.dart';
import 'package:islami_app/ui/caching/cache_helper.dart';

class LanguageProvider extends ChangeNotifier {
  // String locale = "en";
  String selectedLanguage = "en";

  set newLanguage(String language) {
    selectedLanguage = language;
    notifyListeners();
    CacheHelper.putString(key: 'selectedLanguage', value: selectedLanguage);
  }

  LanguageProvider(){
    loadThemeCaching();
  }

  void loadThemeCaching() {
    String language = CacheHelper.getString(key: 'selectedLanguage') ?? 'en';
    selectedLanguage = language;
    notifyListeners();
  }
}
