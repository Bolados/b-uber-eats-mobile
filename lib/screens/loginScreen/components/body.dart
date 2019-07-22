
import 'package:flutter/material.dart';
import 'package:oubereats/screens/base/loginScreen.dart';
import 'package:oubereats/screens/loginScreen/components/loginForm.dart';
import 'package:oubereats/screens/loginScreen/components/header.dart';
import 'package:oubereats/screens/loginScreen/loginScreen.dart';

class Body extends StatelessWidget {

  final LoginFormParam loginFormParam;

  Body({
    @required this.loginFormParam
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column (
        children: <Widget>[
          Header(),
          LoginForm(param: loginFormParam,),
          // Footer()
        ],
      )
    );
  }
}