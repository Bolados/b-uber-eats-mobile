

import 'package:flutter/material.dart';
import 'package:oubereats/screens/loginScreen/components/body.dart';

class LoginScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<LoginScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body()
    );
  }
}