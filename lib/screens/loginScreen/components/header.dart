import 'package:flutter/material.dart';
import 'package:oubereats/services/i18n/i18n.dart';

I18n i18n = I18n.getInstance();

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
      Center(
        child: Container(
          color: Colors.blue,
          padding: EdgeInsets.all(10),
          child: Column(),

        )
      );
  }
}

// Text (
//           i18n.tr("SPLASH_SCREEN.HEADER"),
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontStyle: FontStyle.italic,
//             fontSize: 35.0,
//             color: Colors.white
//           )