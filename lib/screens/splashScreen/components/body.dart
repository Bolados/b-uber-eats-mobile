
import 'package:flutter/material.dart';
import 'package:oubereats/screens/splashScreen/components/background.dart';
import 'package:oubereats/screens/splashScreen/components/footer.dart';
import 'package:oubereats/screens/splashScreen/components/header.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack (
        children: <Widget>[
          Background(),
          // Header(),
          // Footer()
        ]
      );
  }
}