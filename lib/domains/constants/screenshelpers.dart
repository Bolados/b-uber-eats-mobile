
import 'package:flutter/material.dart';

class ScreensHelpers {

  static double height(BuildContext context, double defaultHeight, double percent,){
      Size size = MediaQuery.of(context).size;
      double height = size.height * percent;
      if( height > defaultHeight ) {
        return height;
      }
      return defaultHeight;
  }

}

