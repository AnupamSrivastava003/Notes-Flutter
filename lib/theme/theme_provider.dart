import 'package:flutter/material.dart';
import 'package:notes/theme/theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = ligtMode;
  ThemeData get themedata => _themeData;

  bool get isDarkNode => _themeData == darkMode; 

  set themeData (ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme () {
    if (_themeData == ligtMode){
      themeData = darkMode;
    } else {
      themeData = ligtMode;
    }
  }
}