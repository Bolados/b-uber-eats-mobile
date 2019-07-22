
import 'package:flutter/material.dart';
import 'package:oubereats/screens/loginScreen/components/loginForm.dart';
import 'package:oubereats/screens/loginScreen/components/header.dart';

class Body extends StatelessWidget {
  final List<String> _listViewData = [
    "1 A List View with many Text - Here's one!",
    "2 A List View with many Text - Here's another!",
    "3 A List View with many Text - Here's more!",
    "4 A List View with many Text - Here's more!",
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column (
        children: <Widget>[
          Header(),
          LoginForm(),
          // Footer()
        ],
      )
    );
  }
}