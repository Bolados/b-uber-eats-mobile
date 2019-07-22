import 'package:flutter/material.dart';
import 'package:oubereats/services/i18n/i18n.dart';

I18n i18n = I18n.getInstance();

TextStyle styleTitle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 14.0,
  fontStyle: FontStyle.normal,
  color: Colors.black
);

TextStyle styleTitre = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 30.0,
  color: Colors.black
);

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return 
      Card(
        elevation: 0,
        color: Colors.red,
        margin: EdgeInsets.only(top: 10),
        child: SizedBox(
          width: double.infinity,          
          height: size.height * 40 / 100,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text(
                  i18n.tr("LOGIN_SCREEN.LOGIN_FORM.TITLE"),
                  style: styleTitle,
                ),
              ),
            ]
          ),
        )
      );
  }
}