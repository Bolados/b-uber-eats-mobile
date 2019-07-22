

import 'package:flutter/material.dart';
import 'package:oubereats/screens/loginScreen/components/header.dart';
import 'package:oubereats/services/i18n/i18n.dart';

I18n i18n = I18n.getInstance();


class LoginScreen extends StatefulWidget {
  static String route = '/login';
  static String submitRoute = '';
  static String forgotPasswordRoute = '';
  
  @override
  LoginScreenState createState() => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {

  final TextEditingController _emailFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();

  String _email = "";
  String _password = "";
  bool _passwordVisible = false;

  void _emailListen() {
    if (_emailFilter.text.isEmpty) {
      _email = "";
    } else {
      _email = _emailFilter.text;
    }
  }

  void _passwordListen() {
    if (_passwordFilter.text.isEmpty) {
      _password = "";
    } else {
      _password = _passwordFilter.text;
    }
  }

  @override
  void initState() {
    super.initState();
    _emailFilter.addListener(_emailListen);
    _passwordFilter.addListener(_passwordListen);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      // appBar: _buildBar(context),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: new BoxConstraints(),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column (
            children: <Widget>[
              Header(),
              _buildLoginForm(context),
              // Footer()
            ],
          )
        )
      )
    );
  }

  Widget _buildLoginForm(context){
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(),
          // top: BorderSide(),left: BorderSide(),right: BorderSide(),
        ),
      ),
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        // margin: EdgeInsets.only(top: 10),
        child: SizedBox(
          width: double.infinity,          
          height: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildLoginFormTitle(context),
              _emailField(),
              _passwordField(),
              _forgotPasswordLabel(),
            _submitButton()
            ]
          ),
        )
      )
    );
  }

  TextStyle styleTitle = TextStyle(
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );

  Widget _buildLoginFormTitle(context) {
    return Container( 
      padding: EdgeInsets.all(0),
      child: Text(
        i18n.tr("LOGIN_SCREEN.LOGIN_FORM.TITLE").toUpperCase(),
        style: styleTitle,
      ),
    );
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      title: new Text("Simple Login Example"),
      centerTitle: true,
    );
  }




  Widget _emailField() {
    return Container(
      margin: EdgeInsets.only(top: 5, left: 5, right: 0, bottom: 0),
      padding: EdgeInsets.all( 0),
      child: TextFormField(
        controller: _emailFilter,
        //  controller: _userPasswordController,
        // validator:,
        // onSaved: (val) => _email = val,
        // onFieldSubmitted: (val) => _email = val,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        // initialValue: "",
        decoration: InputDecoration(
          hintText: 'Email',
          labelText: 'Email',
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      margin: EdgeInsets.only(left: 5),
      child: TextFormField(
        keyboardType: TextInputType.text,
        controller: _passwordFilter,
        // validator:,
        // onSaved: (val) => _password = val,
        // onFieldSubmitted: (val) => _password = val,
        obscureText: !_passwordVisible, //This will obscure text dynamically
        decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'Enter your password',
          border: InputBorder.none,
          suffixIcon: IconButton(
            icon: Icon(
              _passwordVisible
              ? Icons.visibility
              : Icons.visibility_off,
              color: Colors.grey,
            ),
            tooltip: 'Show / Hide Password',
            onPressed: () {
              // Update the state i.e. toogle the state of passwordVisible variable
              setState(() {
                  _passwordVisible = !_passwordVisible;
              });
            },
          ),
        ),
      )
    );
  }

  TextStyle forgotPasswordStyle = TextStyle(
    color: Colors.redAccent,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
  );

  TextStyle submitButtonStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    letterSpacing: 2.0
  );

  Widget _forgotPasswordLabel() {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Align(
        alignment: Alignment.centerRight,
        child: FlatButton(
          child: Text(
            'Forgot Password?',
            style: forgotPasswordStyle,
            textAlign: TextAlign.right,
          ),
          padding: EdgeInsets.all(0),
          onPressed: _passwordReset,
        ),
      )
    );
  }

  Widget _submitButton() {
    return Container(
      alignment: Alignment.center,
      child: SizedBox(
        width: double.infinity,    
        height: 50.0,
        child: RaisedButton(
          color: Colors.redAccent,
          child: Text(
            'Login'.toUpperCase(),
            style: submitButtonStyle,
            ),
          onPressed: _loginPressed,
        )
      )
    );
  }
  

 

  // These functions can self contain any user auth logic required, they all have access to _email and _password

  void _loginPressed () {
    print('The user wants to login with $_email and $_password');
  }

  void _passwordReset () {
    print("The user wants a password reset request sent to $_email");
  }
}