

import 'package:flutter/material.dart';
import 'package:oubereats/screens/helpers/screenshelpers.dart';
import 'package:oubereats/screens/registerScreen/components/registerBar.dart';
import 'package:oubereats/screens/registerScreen/components/registerForm.dart';
import 'package:oubereats/screens/verificationScreen/components/verificationBar.dart';
import 'package:oubereats/screens/verificationScreen/components/verificationForm.dart';
import 'package:oubereats/services/i18n/i18n.dart';

I18n i18n = I18n.getInstance();



class VerificationScreen extends StatefulWidget {
  static String route = '/verification';
  static String submitRoute = '';
  
  @override
  _VerificationScreenState createState() => new _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    AppBar verificationBar = VerificationBar(context: context).buildBar();
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: verificationBar,
      body: Container(
        padding: EdgeInsets.only(bottom: bottom),
        child: ListView(
          padding: EdgeInsets.all(12.0),
          children: <Widget>[ 
            VerificationForm(verificationBar: verificationBar),
          ]
        )
      ),
    );
  }
}