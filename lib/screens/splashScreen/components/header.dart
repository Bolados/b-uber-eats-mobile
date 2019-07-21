

import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
      Center(
        child: Text (
          "STAR DELIVERY",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            fontSize: 35.0,
            color: Colors.white
          )
        ),
      );
  }
}