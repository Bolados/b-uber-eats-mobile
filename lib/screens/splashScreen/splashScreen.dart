
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:oubereats/domains/constants/routes.dart';
import 'package:oubereats/screens/splashScreen/components/body.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed(ROUTE.HOME);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body()
    );
  }
}