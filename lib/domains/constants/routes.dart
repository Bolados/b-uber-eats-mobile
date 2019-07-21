
import 'package:flutter/cupertino.dart';
import 'package:oubereats/main.dart';
import 'package:oubereats/screens/example1/examplescreen1.dart';
import 'package:oubereats/screens/example2/examplescreen2.dart';
import 'package:oubereats/screens/splashScreen/splashScreen.dart';

class ROUTE {
  static final String INDEX = "/";
  static final String HOME = "/home";
  static final String SPLASH_SCREEN = "/splash";
}

final Map<String, WidgetBuilder> ROUTES = {
    // ROUTE.INDEX: (BuildContext context) => SplashScreen(),
    ROUTE.HOME: (BuildContext context) => MyHomePage(title: 'Flutter Demo Home Page'),
    ROUTE.SPLASH_SCREEN: (BuildContext context) => SplashScreen(),
    "/ExScreen1": (BuildContext context) => ExScreen1(),
    "/ExScreen2": (BuildContext context) => ExScreen2(),
  };

  