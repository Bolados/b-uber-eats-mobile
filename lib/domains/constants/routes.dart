
import 'package:flutter/cupertino.dart';
import 'package:oubereats/main.dart';
import 'package:oubereats/screens/example1/examplescreen1.dart';
import 'package:oubereats/screens/homeScreen/homeScreen.dart';
import 'package:oubereats/screens/loginScreen/loginScreen.dart';
import 'package:oubereats/screens/registerScreen/registerScreen.dart';
import 'package:oubereats/screens/splashScreen/splashScreen.dart';
import 'package:oubereats/screens/verificationScreen/verificationScreen.dart';

class ROUTE {
  static const String INDEX = "/";
  static const String HOME = HomeScreen.route;
  static const String SPLASH_SCREEN = SplashScreen.route;
  static const String LOGIN_SCREEN = LoginScreen.route;
  static const String REGISTER_SCREEN = RegisterScreen.route;
  static const String VERIFICATION_SCREEN = VerificationScreen.route;

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
    ROUTE.HOME: (BuildContext context) => HomeScreen(),
    ROUTE.SPLASH_SCREEN: (BuildContext context) => SplashScreen(),
    ROUTE.LOGIN_SCREEN: (BuildContext context) => LoginScreen(),
    ROUTE.REGISTER_SCREEN: (BuildContext context) => RegisterScreen(),
    ROUTE.VERIFICATION_SCREEN: (BuildContext context) => VerificationScreen(),
    "/ExScreen1": (BuildContext context) => ExScreen1(),
    "/ExScreen2": (BuildContext context) => LoginScreen(),
  };

  