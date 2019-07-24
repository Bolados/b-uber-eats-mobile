import 'package:flutter/material.dart';
import 'package:oubereats/screens/helpers/screenshelpers.dart';
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
    Orientation orientation = MediaQuery.of(context).orientation;
    return Container(
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        margin: (orientation == Orientation.portrait) 
          ? EdgeInsets.fromLTRB(
            ScreensHelpers.sizeWidth(context, 5, 0.01), 
            ScreensHelpers.sizeHeight(context, 10, 0.01), 
            ScreensHelpers.sizeWidth(context, 5, 0.01), 
            ScreensHelpers.sizeHeight(context, 5, 0.01)
          ) 
          : EdgeInsets.fromLTRB(
            ScreensHelpers.sizeWidth(context, 5, 0.03), 
            ScreensHelpers.sizeHeight(context, 10, 0.01), 
            ScreensHelpers.sizeWidth(context, 5, 0.03), 
            ScreensHelpers.sizeHeight(context, 5, 0.01)
          )  ,
        child: SizedBox(
          width: double.infinity,       
          height: (orientation == Orientation.portrait) 
            ? ScreensHelpers.sizeHeight(context, 85, 0.1) 
            : ScreensHelpers.sizeHeight(context, 85, 0.2) ,
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
      )
    );
  }
}