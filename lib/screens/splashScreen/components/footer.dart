import 'package:flutter/material.dart';
import 'package:oubereats/services/i18n/i18n.dart';

I18n i18n = I18n.getInstance();
class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double delta = 10 / 100;
    return 
      Align(
        alignment: Alignment.bottomCenter,
        child:  Padding (
          padding: EdgeInsets.only(bottom: size.height * delta),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                i18n.tr("SPLASH_SCREEN.FOOTER.FIRST").toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12.0,
                  color: Colors.white
                )
              ),
              Text(
                i18n.tr("SPLASH_SCREEN.FOOTER.SECOND").toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12.0,
                  color: Colors.white
                )
              ),
            ],
          ),
        ),
      );
  }
}