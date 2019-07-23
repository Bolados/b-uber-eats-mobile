

import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return 
      Container ( 
        padding: EdgeInsets.all(5.0),
        child: Image.asset(
            'assets/images/background_splash.png',
            width: size.width,
            height: size.height,
            fit: BoxFit.fill,
          ),
      );
  }
}