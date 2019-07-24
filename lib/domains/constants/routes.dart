
import 'package:flutter/cupertino.dart';
import 'package:oubereats/main.dart';
import 'package:oubereats/screens/example1/examplescreen1.dart';
import 'package:oubereats/screens/loginScreen/loginScreen.dart';
import 'package:oubereats/screens/registerScreen/registerScreen.dart';
import 'package:oubereats/screens/splashScreen/splashScreen.dart';
import 'package:oubereats/screens/verificationScreen/verificationScreen.dart';

class ROUTE {
  static final String INDEX = "/";
  static final String HOME = "/home";
  static final String SPLASH_SCREEN = SplashScreen.route;
  static final String LOGIN_SCREEN = LoginScreen.route;
  static final String REGISTER_SCREEN = RegisterScreen.route;
  static final String VERIFICATION_SCREEN = VerificationScreen.route;

  static Future<Null> init() {
    SplashScreen.redirect = LOGIN_SCREEN;
    LoginScreen.registerRoute = REGISTER_SCREEN;
    LoginScreen.submitRoute = HOME;
    LoginScreen.forgotPasswordRoute = "";
    RegisterScreen.submitRoute = VERIFICATION_SCREEN;
    VerificationScreen.submitRoute = HOME;
    return null;
  }
}

final Map<String, WidgetBuilder> ROUTES = {
    // ROUTE.INDEX: (BuildContext context) => SplashScreen(),
    ROUTE.HOME: (BuildContext context) => MyHomePage(title: 'Flutter Demo Home Page'),
    ROUTE.SPLASH_SCREEN: (BuildContext context) => SplashScreen(),
    ROUTE.LOGIN_SCREEN: (BuildContext context) => LoginScreen(),
    ROUTE.REGISTER_SCREEN: (BuildContext context) => RegisterScreen(),
    ROUTE.VERIFICATION_SCREEN: (BuildContext context) => VerificationScreen(),
    "/ExScreen1": (BuildContext context) => ExScreen1(),
    "/ExScreen2": (BuildContext context) => LoginScreen(),
  };

  