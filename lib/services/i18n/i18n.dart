
import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:oubereats/services/i18n/languages.dart';
import 'package:shared_preferences/shared_preferences.dart';

///
/// Preferences related
///
const String _storageKey = "MyApplication_";
const List<String> _supportedLanguages = languages;
Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class I18n {
  Locale _locale;
  Map<dynamic, dynamic> _sentences;
  VoidCallback _onLocaleChangedCallback;

  ///
  /// Returns the list of supported Locales
  ///
  Iterable<Locale> supportedLocales() => _supportedLanguages.map<Locale>((lang) => new Locale(lang, ''));

  ///
  /// Returns the translation that corresponds to the [key]
  ///
  String text(String key) {
    // Return the requested string
     return (_sentences == null || _sentences[key] == null) ? '** $key not found' : _sentences[key];
  }

  ///
  /// Returns the current language code
  ///
  get currentLanguage => _locale == null ? '' : _locale.languageCode;

  ///
  /// Returns the current Locale
  ///
  get locale => _locale;
  
  ///
  /// One-time initialization
  /// 
  Future<Null> init([String language]) async {
    if (_locale == null){
      await setNewLanguage(language);
    }
    return null;
  }

  /// ----------------------------------------------------------
  /// Method that saves/restores the preferred language
  /// ----------------------------------------------------------
  getPreferredLanguage() async {
    return _getApplicationSavedInformation('language');
  }
  setPreferredLanguage(String lang) async {
    return _setApplicationSavedInformation('language', lang);
  }

  static Future<String> loadJsonFromAsset(language) async {
    return await rootBundle.loadString('assets/i18n/' + language + '.json');
  }

  ///
  /// Routine to change the language
  ///
  Future<Null> setNewLanguage([String newLanguage, bool saveInPrefs = false]) async {
    String language = newLanguage;
    if (language == null){
      language = await getPreferredLanguage();
    }

    // Set the locale
    if (language == ""){
      language = "en";
    }
    _locale = Locale(language, "");

    // Load the language strings
    // Future<String> jsonContent = loadJsonFromAsset(_locale.languageCode);
    _sentences = json.decode(await loadJsonFromAsset(language));

    // If we are asked to save the new language in the application preferences
    if (saveInPrefs){
        await setPreferredLanguage(language);
    }

    // If there is a callback to invoke to notify that a language has changed
    if (_onLocaleChangedCallback != null){
        _onLocaleChangedCallback();
    }

    return null;
  }

  ///
  /// Callback to be invoked when the user changes the language
  ///
  set onLocaleChangedCallback(VoidCallback callback){
    _onLocaleChangedCallback = callback;
  }

  ///
  /// Application Preferences related
  ///
  /// ----------------------------------------------------------
  /// Generic routine to fetch an application preference
  /// ----------------------------------------------------------
  Future<String> _getApplicationSavedInformation(String name) async {
    final SharedPreferences prefs = await _prefs;

    return prefs.getString(_storageKey + name) ?? '';
  }

  /// ----------------------------------------------------------
  /// Generic routine to saves an application preference
  /// ----------------------------------------------------------
  Future<bool> _setApplicationSavedInformation(String name, String value) async {
    final SharedPreferences prefs = await _prefs;

    return prefs.setString(_storageKey + name, value);
  }


  ///
  /// Singleton Factory
  /// 
  static final I18n _translations = new I18n._internal();
  factory I18n() {
    return _translations;
  }
  I18n._internal();
}

I18n i18n = new I18n();