import 'package:flutter/material.dart';
import 'package:oubereats/services/i18n/i18n.dart';

I18n i18n = I18n.getInstance();

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => new _LoginFormState();
}


class _LoginFormState extends State<LoginForm> {
  String _email = "";
  String _password = "";
  bool _passwordVisible = false;

  // These functions can self contain any user auth logic required, they all have access to _email and _password

  _submit () {
    print('The user wants to login with ${_email} and ${_password}');
  }

  _passwordReset () {
    print("The user wants a password reset request sent to ${_email}");
  }

  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_emailListen);
    _passwordController.addListener(_passwordListen);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(),
          top: BorderSide(),left: BorderSide(),right: BorderSide(),
        ),
      ),
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        margin: EdgeInsets.all(5),
        child: SizedBox (
          width: double.infinity,          
          height: 300,
          child: Form(
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
      )
    );
  }

  Widget _buildLoginFormTitle(context) {
    return Container( 
      padding: EdgeInsets.all(0),
      child: Text(
        i18n.tr("LOGIN_SCREEN.LOGIN_FORM.TITLE").toUpperCase(),
        style: styleTitle,
      ),
    );
  }

  Widget _emailField() {
    return Container(
      margin: EdgeInsets.only(top: 5, left: 5, right: 0, bottom: 0),
      padding: EdgeInsets.all( 0),
      child: TextFormField(
        controller: _emailController,
        // validator:,
        // onSaved: (val) => _email = val,
        // onFieldSubmitted: (val) => _email = val,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        // initialValue: "",
        decoration: InputDecoration(
          hintText:  i18n.tr("LOGIN_SCREEN.LOGIN_FORM.INPUT.EMAIL.HINT"),
          labelText: i18n.tr("LOGIN_SCREEN.LOGIN_FORM.INPUT.EMAIL.LABEL"),
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
        controller: _passwordController,
        // validator:,
        // onSaved: (val) => _password = val,
        // onFieldSubmitted: (val) => _password = val,
        obscureText: !_passwordVisible, //This will obscure text dynamically
        decoration: InputDecoration(
          hintText:  i18n.tr("LOGIN_SCREEN.LOGIN_FORM.INPUT.PASSWORD.HINT"),
          labelText: i18n.tr("LOGIN_SCREEN.LOGIN_FORM.INPUT.PASSWORD.LABEL"),
          border: InputBorder.none,
          suffixIcon: IconButton(
            icon: Icon(
              _passwordVisible
              ? Icons.visibility
              : Icons.visibility_off,
              color: Colors.grey,
            ),
            tooltip: i18n.tr("LOGIN_SCREEN.LOGIN_FORM.ACTIONS.HIDE_SHOW_PASSWORD.TOOLTIP"),
            onPressed: _togglePasswordVisibility,
          ),
        ),
      )
    );
  }

  Widget _forgotPasswordLabel() {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Align(
        alignment: Alignment.centerRight,
        child: FlatButton(
          child: Text(
            i18n.tr("LOGIN_SCREEN.LOGIN_FORM.ACTIONS.FORGOT_PASSWORD.TITLE"),
            style: forgotPasswordStyle,
            textAlign: TextAlign.right,
          ),
          padding: EdgeInsets.all(0),
          onPressed: _passwordReset
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
            i18n.tr("LOGIN_SCREEN.LOGIN_FORM.ACTIONS.SUBMIT.TITLE").toUpperCase(),
            style: submitButtonStyle,
            ),
          onPressed: _submit
        )
      )
    );
  }

  void _togglePasswordVisibility () {
    setState(() {
        _passwordVisible = !_passwordVisible;
    });
  }


  void _emailListen() {
    if (_emailController.text.isEmpty) {
      _email = "";
    } else {
      _email = _emailController.text;
    }
  }

  void _passwordListen() {
    if (_passwordController.text.isEmpty) {
      _password = "";
    } else {
      _password = _passwordController.text;
    }
  }

  TextStyle styleTitle = TextStyle(
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );

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


}
  