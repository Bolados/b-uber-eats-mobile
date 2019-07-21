

import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double delta = 5.0;
    return 
      Center ( 
        child: Padding (
          padding: EdgeInsets.all(delta),
          child: new Image.asset(
            'assets/images/background_splash.png',
            width: size.width - delta,
            height: size.height - delta,
            fit: BoxFit.fill,
          ),
        ),
      );
  }
}