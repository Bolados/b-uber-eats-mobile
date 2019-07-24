
import 'package:flutter/material.dart';

class ScreensHelpers {
  
  static double sizeHeight(BuildContext context, double defaultHeight, double percent,){
      Size size = MediaQuery.of(context).size;
      double height = size.height * percent;
      if( height > defaultHeight ) {
        return height;
      }
      return defaultHeight;
  }

  static double sizeWidth(BuildContext context, double defaultSize, double percent,){
      Size size = MediaQuery.of(context).size;
      double res = size.width * percent;
      if( res > defaultSize ) {
        return res;
      }
      return defaultSize;
  }

}

