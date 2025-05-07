import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool isLightTheme;

  ThemeProvider({required this.isLightTheme});

  ThemeData get getThemeData => isLightTheme ? ThemeData.light() : ThemeData.dark();

  set setThemeData(bool val) {
    isLightTheme = val;
    notifyListeners();
  }
}