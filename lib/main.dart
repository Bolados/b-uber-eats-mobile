import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:oubereats/domains/constants/routes.dart';
import 'package:oubereats/screens/splashScreen/splashScreen.dart';
import 'package:oubereats/theme/theme.dart';
import 'package:oubereats/services/i18n/i18n.dart';
import 'dart:ui' as ui;

I18n i18n = I18n.getInstance();

void main() async {

  await ROUTE.init();
  // Initializes the translation module
  // await i18n.init(ui.window.locale.languageCode);
  await i18n.init('en');
  
  // then start the application
  runApp( MyApplication(),);
}

class MyApplication extends StatefulWidget {
  @override
  _MyApplicationState createState() => _MyApplicationState();
}

class _MyApplicationState extends State<MyApplication> {
  @override
  void initState(){
      super.initState();

      // Initializes a callback should something need 
      // to be done when the language is changed
      i18n.onLocaleChangedCallback = _onLocaleChanged;
      
  }

  ///
  /// If there is anything special to do when the user changes the language
  ///
  _onLocaleChanged() async {
      // do anything you need to do if the language changes
      print('Language has been changed to: ${i18n.currentLanguage}');
  }

    ///
    /// Main initialization
    ///
    // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: appTheme(),
      home:  SplashScreen(),
      routes: ROUTES,
      localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
      ],
      // Tells the system which are the supported languages
      supportedLocales: i18n.supportedLocales(),
    );
  }
}
