import 'package:flutter/material.dart';
import 'package:noteapp/caches/sharedpref/shared_preference_helper.dart';

class LanguageProvider extends ChangeNotifier {
  // shared pref object
  late SharedPreferenceHelper _sharedPrefsHelper;

  Locale _appLocale = Locale('en');

  LanguageProvider() {
    _sharedPrefsHelper = SharedPreferenceHelper();
    _loadLanguage();
  }

  Future<void> _loadLanguage() async {
    final languageCode = await _sharedPrefsHelper.appLocale;
    _appLocale = Locale(languageCode ?? 'en');
    notifyListeners();
  }

  Locale get appLocale {
    return _appLocale;
  }

  void updateLanguage(String languageCode) {
    if (languageCode == "zh") {
      _appLocale = Locale("zh");
    } else {
      _appLocale = Locale("en");
    }

    _sharedPrefsHelper.changeLanguage(languageCode);
    notifyListeners();
  }
}
