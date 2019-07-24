

import 'package:flutter/material.dart';
import 'package:oubereats/screens/helpers/screenshelpers.dart';
import 'package:oubereats/screens/loginScreen/components/footer.dart';
import 'package:oubereats/screens/loginScreen/components/header.dart';
import 'package:oubereats/screens/loginScreen/components/loginForm.dart';
import 'package:oubereats/screens/loginScreen/components/social.dart';
import 'package:oubereats/services/i18n/i18n.dart';

I18n i18n = I18n.getInstance();


class LoginScreen extends StatefulWidget {
  static const String route = '/login';
  static String registerRoute = '';
  static String submitRoute = '';
  static String forgotPasswordRoute = '';
  
  @override
  _LoginScreenState createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: ListView(
        padding: (orientation == Orientation.portrait) 
          ?  EdgeInsets.fromLTRB(
            ScreensHelpers.sizeWidth(context, 12, 0.01), 
            ScreensHelpers.sizeHeight(context, 12, 0.01), 
            ScreensHelpers.sizeWidth(context, 12, 0.01), 
            ScreensHelpers.sizeHeight(context, 12, 0.01)
          )  
          :  EdgeInsets.fromLTRB(
            ScreensHelpers.sizeWidth(context, 12, 0.05), 
            ScreensHelpers.sizeHeight(context, 12, 0.05), 
            ScreensHelpers.sizeWidth(context, 12, 0.05), 
            ScreensHelpers.sizeHeight(context, 12, 0.05)
          )   ,
        children: <Widget>[ 
          Header(),
          SizedBox(
            height: orientation == Orientation.portrait ? 0.0 : 1.0,
          ),
          LoginForm(),
          SizedBox(
            height: orientation == Orientation.portrait ? 0.0 : 1.0,
          ),
          Social(),
          SizedBox(
            height: orientation == Orientation.portrait ? 0.0 : 1.0,
          ),
          Footer(),
        ]
      ),
    );
  }


}