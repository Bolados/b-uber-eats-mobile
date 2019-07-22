import 'package:flutter/material.dart';
import 'package:oubereats/services/i18n/i18n.dart';

I18n i18n = I18n.getInstance();

TextStyle styleWelcome = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 14.0,
  fontStyle: FontStyle.normal,
  color: Colors.black38
);

TextStyle styleTitre = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 30.0,
  color: Colors.black
);

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return 
      Card(
        elevation: 0,
        color: Colors.blue,
        margin: EdgeInsets.only(top: 10),
        child: SizedBox(
          width: double.infinity,          
          height: size.height * 20 / 100,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                  i18n.tr("LOGIN_SCREEN.HEADER.WELCOME_TO"),
                  style: styleWelcome
                ),    
              Text(
                i18n.tr("LOGIN_SCREEN.HEADER.TITLE.~").toUpperCase(),
                style: styleTitre
              ),
            ]
          ),
        )
      );
  }
}