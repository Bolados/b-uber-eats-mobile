

import 'package:flutter/material.dart';
import 'package:oubereats/services/i18n/i18n.dart';

I18n i18n = I18n.getInstance();


class RegisterScreen extends StatefulWidget {
  static String route = '/register';
  static String submitRoute = '';
  
  @override
  _RegisterScreenState createState() => new _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

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
      appBar: _buildBar(context),
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

  Widget _buildBar(context){
    return AppBar(
        title: Text("Create Account"),
      );
  }

  Widget _buildBody(context) {

  }

}