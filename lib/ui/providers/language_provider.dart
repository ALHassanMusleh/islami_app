import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  // String locale = "en";
  String selectedLanguage = "en";

  set newLanguage(String language) {
    selectedLanguage = language;
    notifyListeners();
  }
}
