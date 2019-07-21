
import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:oubereats/services/i18n/languages.dart';

Future<String> loadJsonFromAsset(language) async {
  return await rootBundle.loadString('assets/i18n/' + language + '.json');
}

Map<String, String> convertValueToString(obj) {
  Map<String, String> result = {};
  obj.forEach((key, value) {
    result[key] = value.toString();
  });
  return result;
}

Future<Map<String, Map<String, String>>> initializeI18n() async {
  Map<String, Map<String, String>> values = {};
  for (String language in languages) {
    Map<String, dynamic> translation =
        json.decode(await loadJsonFromAsset(language));
    values[language] = convertValueToString(translation);
  }
  return values;
}

class I18n {
  I18n(this.locale, this.path);

  Locale locale;
  final String path;

  static I18n of(BuildContext context) {
    return Localizations.of<I18n>(context, I18n);
  }

  Map<String, dynamic> _sentences;

  static bool isSupported(Locale locale) => (locale != null) && languages.contains(locale.languageCode);
  static Future<String> loadJsonFromAsset(language) async {
    return await rootBundle.loadString('assets/i18n/' + language + '.json');
  }

  changeLocale(Locale locale){
    if(isSupported(locale) && (locale.languageCode != this.locale.languageCode)) {
      this.locale = locale;
    }
  }

  Future<bool> load() async {
    String data;
    if (this.locale.languageCode == null || this.locale.countryCode == null) {
      this.locale = Locale("en", "US");
    }
    data = await loadJsonFromAsset(this.locale.languageCode);
    Map<String, dynamic> _result = json.decode(data);

    this._sentences = new Map();
    _result.forEach((String key, dynamic value) {
      this._sentences[key] = value;
    });

    return true;
  }

  String tr(String key, {List<String> args}) {
    String res = this._resolve(key, this._sentences);
    if (args != null) {
      args.forEach((String str) {
        res = res.replaceFirst(RegExp(r'{}'), str);
      });
    }
    return res;
  }

  String plural(String key, dynamic value) {
    String res = '';
    if (value == 0) {
      res = this._sentences[key]['zero'];
    } else if (value == 1) {
      res = this._sentences[key]['one'];
    } else {
      res = this._sentences[key]['other'];
    }
    return res.replaceFirst(RegExp(r'{}'), '$value');
  }

  String _resolve(String path, dynamic obj) {
    List<String> keys = path.split('.');

    if (keys.length > 1) {
      for (int index = 0; index <= keys.length; index++) {
        if (obj.containsKey(keys[index]) && obj[keys[index]] is! String) {
          return _resolve(
              keys.sublist(index + 1, keys.length).join('.'), obj[keys[index]]);
        }

        return obj[path] ?? path;
      }
    }

    return obj[path] ?? path;
  }
}

class I18nDelegate extends LocalizationsDelegate<I18n> {
  final Locale locale;
  final String path;

  I18nDelegate({@required this.locale, @required this.path});

  @override
  bool isSupported(Locale locale) => I18n.isSupported(locale);

  @override
  Future<I18n> load(Locale locale) async {
    I18n localizations = I18n(locale, path);
    await localizations.load();
    print("Load ${locale.languageCode}");
    return localizations;
  }

  @override
  bool shouldReload(LocalizationsDelegate<I18n> old) => true;
}