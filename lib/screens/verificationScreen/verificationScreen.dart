

import 'package:flutter/material.dart';
import 'package:oubereats/screens/verificationScreen/components/verificationBar.dart';
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
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: VerificationBar(context: context).buildBar(),
      body: ListView(
        padding: EdgeInsets.all(12.0),
        children: <Widget>[ 
          // Header(),
          // SizedBox(
          //   height: orientation == Orientation.portrait ? 0.0 : 1.0,
          // ),
          // LoginForm(),
          // SizedBox(
          //   height: orientation == Orientation.portrait ? 0.0 : 1.0,
          // ),
          // Social(),
          // SizedBox(
          //   height: orientation == Orientation.portrait ? 0.0 : 1.0,
          // ),
          // Footer(),
        ]
      ),
    );
  }


}