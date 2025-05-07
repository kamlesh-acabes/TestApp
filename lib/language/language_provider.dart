import 'package:flutter/material.dart';

class LanguageProvider with ChangeNotifier {
  bool isEnglish = true;
  LanguageProvider({required this.isEnglish});

  void changeLanguage() {
    isEnglish = !isEnglish;
    notifyListeners();
  }
}