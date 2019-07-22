

import 'package:flutter/material.dart';
import 'package:oubereats/screens/loginScreen/components/body.dart';

class LoginScreen extends StatefulWidget {
  static String route = '/login';
  static String submitRoute = '';
  static String forgotPasswordRoute = '';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;
  final _passwordFieldKey = GlobalKey<FormFieldState<String>>();

  
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