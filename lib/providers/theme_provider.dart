import 'package:flutter/material.dart';
import 'package:noteapp/caches/sharedpref/shared_preference_helper.dart';

class ThemeProvider extends ChangeNotifier {
  // shared pref object
  late SharedPreferenceHelper _sharedPrefsHelper;

  bool _isDarkModeOn = false;

  ThemeProvider() {
    _sharedPrefsHelper = SharedPreferenceHelper();
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    _isDarkModeOn = await _sharedPrefsHelper.isDarkMode;
    notifyListeners();
  }

  bool get isDarkModeOn {
    return _isDarkModeOn;
  }

  void updateTheme(bool isDarkModeOn) {
    _sharedPrefsHelper.changeTheme(isDarkModeOn);
    _sharedPrefsHelper.isDarkMode.then((darkModeStatus) {
      _isDarkModeOn = darkModeStatus;
    });

    notifyListeners();
  }
}
