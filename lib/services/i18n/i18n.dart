
import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

///
/// Preferences related
///
const String _storageKey = "MyApplication_";
const List<String> _supportedLanguages = ['en', 'fr'];
const Map<String, String> _plurialSettings = {
  "KEY" : "PREFERENCES.PLURAL",
  "MAX" : "PREFERENCES.PLURAL.MAX",
  "MAX_KEY": "PREFERENCES.PLURAL.KEY"
};
const Map<String, String> _linksSettings = {
  "KEY" : "PREFERENCES.LINKS.KEY",
};
const Map<String, String> _resolverSettings = {
  "SPLIT_KEY" : ".",
};
final String defaultLanguage = _supportedLanguages[0];
final String defaultLoadResourcesPath = "assets/i18n";
Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class I18n {
  Locale _locale;
  String _loadResourcesPath;
  Map<dynamic, dynamic> _sentences;
  VoidCallback _onLocaleChangedCallback;

  static I18n instance;

  ///
  /// One-time initialization class indicate load path
  /// 
  static I18n getInstance([String path]) {
    if (I18n.instance == null){
      I18n.instance = new I18n();
    } 
    if (path != null) {
      I18n.instance._loadResourcesPath = path;
    }
    return I18n.instance;
  }

  ///
  /// Returns the list of supported Locales
  ///
  Iterable<Locale> supportedLocales() => _supportedLanguages.map<Locale>((lang) => new Locale(lang, ''));

  ///
  /// Returns the current language code
  ///
  get currentLanguage => _locale == null ? '' : _locale.languageCode;

  ///
  /// Returns the current Locale
  ///
  get locale => _locale;

  ///
  /// Returns the ressources path Ex: assets/i18n
  ///
  get loadResourcesPath => _loadResourcesPath == null ? defaultLoadResourcesPath : _loadResourcesPath;

  

  ///
  /// One-time initialization language
  /// 
  Future<Null> init([String language]) async {
    if (_locale == null) {
      if( (language == null) || !_supportedLanguages.contains(language)){
        language = defaultLanguage;
      }
      await setLanguage(language);
    }
    return null;
  }

   /// ----------------------------------------------------------
  /// Method that translate sentences
  /// ----------------------------------------------------------

  
  String text(String key) {
    // Return the requested string
     return (_sentences == null || _sentences[key] == null) ? '** $key not found' : _sentences[key];
  }

  ///
  /// Returns the translation that corresponds to the [key] consider [path]
  ///
  dynamic _resolve(String path, dynamic obj) {
    List<String> keys = path.split(_resolverSettings['SPLIT_KEY']);
    if (keys.length > 1) {
      for (int index = 0; index <= keys.length; index++) {
        if (obj.containsKey(keys[index]) && ( ( obj[keys[index]] is! String) || ( obj[keys[index]] is! int) )  ) {
          return _resolve(
              keys.sublist(index + 1, keys.length).join('.'), obj[keys[index]]);
        }

        return obj[path] ?? path;
      }
    }

    return obj[path] ?? path;
  }

  bool isLink(String path) {
    final key = _resolve(_linksSettings['KEY'], _sentences);
    return path.contains(key);
  }

  dynamic _resolver(String path, dynamic obj) {
    if (isLink(path)) {
      // resolve link
      final res = _resolve(path, obj);
      // resolve path link
      return _resolve(res, obj);
    }
    return _resolve(path, obj);
  }

  ///
  /// Returns the translation that corresponds to the [key] and replace [args]
  /// Ex :  
  ///   .json => "msg": "Hello {} in the {} world ",
  ///   use => tr('msg', args: ['val1', 'val2']))
  /// 
  ///
  String tr(String key, {List<String> args}) {
    String res = _resolver(key, _sentences);
    if (args != null) {
      args.forEach((String str) {
        res = res.replaceFirst(RegExp(r'{}'), str);
      });
    }
    return res;
  }

  ///
  /// Returns the plural of translation that corresponds to the [key]
  /// Ex :
  /// .json => "clicked": {
  ///  "zero": "You clicked {} times!",
  ///   "one": "You clicked {} time!",
  ///   "other": "You clicked {} times!"
  /// use => plural('clicked', [int counter])
  ///
  String plural(String key, dynamic value) {
    int maxNumber = _resolver(_plurialSettings['MAX'], _sentences);
    String maxKey = _resolver(_plurialSettings['MAX_KEY'], _sentences);
    if(value >= maxNumber) {
      key = key + '.' + maxKey;
    } else {
      key = key + '.' + value.toString();
    }
    String res = _resolver(key, _sentences) ;
    return (res != null) ? res.replaceFirst(RegExp(r'{}'), '$value') : key;
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

  /// 
  /// Load Json from Asset
  Future<String> loadJsonFromAsset(language) async {
    return await rootBundle.loadString(loadResourcesPath + '/' + language + '.json');
  }

  ///
  /// Routine to change the language
  ///
  ///

  Future<Null> setLanguage([String newLanguage, bool saveInPrefs = false]) async {
    String language = newLanguage;
    if (language == null) {
      language = await getPreferredLanguage();
    }

    if (language.isEmpty) {
      language = defaultLanguage;
    }
  
    if ((_locale == null) || (_locale.languageCode != language)) {

      _locale = Locale(language, "");
      // Load the language strings
      _sentences = json.decode(await loadJsonFromAsset(language));

      // If we are asked to save the new language in the application preferences
      if (saveInPrefs){
          await setPreferredLanguage(language);
      }

      // If there is a callback to invoke to notify that a language has changed
      if (_onLocaleChangedCallback != null){
          _onLocaleChangedCallback();
      }

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