

import 'package:flutter/material.dart';
import 'package:oubereats/screens/helpers/screenshelpers.dart';
import 'package:oubereats/screens/registerScreen/components/registerBar.dart';
import 'package:oubereats/screens/registerScreen/components/registerForm.dart';
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
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    AppBar registerBar = RegisterBar(context: context).buildBar();
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: registerBar,
      body: Container(
        padding: EdgeInsets.only(bottom: bottom),
        child: ListView(
          padding: EdgeInsets.all(12.0),
          children: <Widget>[ 
            RegisterForm(registerBar: registerBar,),
            SizedBox(
              height: orientation == Orientation.portrait ? 0.0 : 1.0,
            ),
            _labelTerms(context),
          ]
        )
      ),
    );
  }

  
  Widget _labelTerms(context) {
    Size size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Container(
      margin: (orientation == Orientation.portrait) 
          ? EdgeInsets.fromLTRB(
            ScreensHelpers.sizeWidth(context, 5, 0.01), 
            ScreensHelpers.sizeHeight(context, 0, 0), 
            ScreensHelpers.sizeWidth(context, 5, 0.01), 
            ScreensHelpers.sizeHeight(context, 0, 0)
          ) 
          : EdgeInsets.fromLTRB(
            ScreensHelpers.sizeWidth(context, 5, 0.05), 
            ScreensHelpers.sizeHeight(context, 0, 0), 
            ScreensHelpers.sizeWidth(context, 5, 0.05), 
            ScreensHelpers.sizeHeight(context, 0, 0)
          ),
      child: Text(
       i18n.tr("REGISTER_SCREEN.FOOTER.LABEL"),
      ),
    );
  }


}