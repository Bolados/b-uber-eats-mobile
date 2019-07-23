

import 'package:flutter/material.dart';
import 'package:oubereats/screens/loginScreen/components/header.dart';
import 'package:oubereats/screens/loginScreen/components/loginForm.dart';
import 'package:oubereats/screens/loginScreen/components/social.dart';
import 'package:oubereats/services/i18n/i18n.dart';

I18n i18n = I18n.getInstance();


class LoginScreen extends StatefulWidget {
  static String route = '/login';
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
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      // appBar: _buildBar(context),
      body: body(context),
    );
  }

  Widget body(context) {
    return Material(
      child: SafeArea(
        child: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            return ListView(
              padding: EdgeInsets.all(8.0),
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
              ]
            );
          }
        )
      )
    );
  }
}