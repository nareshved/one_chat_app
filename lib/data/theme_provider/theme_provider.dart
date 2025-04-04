import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DarkThemeProvider extends ChangeNotifier {
  static const String isDarkKey = "isDark";

  static bool _isDark = false;

  bool get themeValue {
    updateThemeOnStartApp();
    return _isDark;
  }

  set themeValue(bool value) {
    _isDark = value;

    updateThemeOnPrefs(value);

    notifyListeners();
  }

  void updateThemeOnPrefs(bool value) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool(isDarkKey, value);
  }

  void updateThemeOnStartApp() async {
    var prefs = await SharedPreferences.getInstance();
    var isDarkValue = prefs.getBool(isDarkKey);

    if (isDarkValue != null) {
      _isDark = isDarkValue;
    } else {
      _isDark = false;
    }

    notifyListeners();
  }
}
