import 'package:flutter/material.dart';

extension DarkMode on BuildContext {
  bool get isDarkMode {
    return Theme.of(this).brightness == Brightness.dark;
  }
}

/*
before: 
Theme.of(this).brightness == Brightness.dark ? Colors.black : Colors.white

after: 
context.isDarkMode ? Colors.black : Colors.white
*/