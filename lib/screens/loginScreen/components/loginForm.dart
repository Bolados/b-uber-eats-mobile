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

  _loginPressed () {
    print('The user wants to login with ${_email} and ${_password}');
  }

  _passwordReset () {
    print("The user wants a password reset request sent to ${_email}");
  }

  _togglePasswordVisibility () {
    this.setState((){});
    print("Toogle password to ${_passwordVisible}");
   
  }

  final TextEditingController _emailFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailFilter.addListener(_emailListen);
    _passwordFilter.addListener(_passwordListen);
  }

  // final TextEditingController _emailFilter = new TextEditingController();
  // final TextEditingController _passwordFilter = new TextEditingController();

  // String email = "";
  // String password = "";
  // bool passwordVisible = false;
  // VoidCallback submitAction;
  // VoidCallback forgotPasswordAction;
  // VoidCallback showPasswordAction;

  // @override
  // void initState() {
  //   super.initState();
  //   _emailFilter.addListener(_emailListen);
  //   _passwordFilter.addListener(_passwordListen);
  //   _loginForm.forgotPasswordAction = _passwordReset;
  //   _loginForm.submitAction = _loginPressed;
  //   _loginForm.showPasswordAction = _togglePasswordVisibility;
  // }

  // void _emailListen() {
  //   if (_emailFilter.text.isEmpty) {
  //     email = "";
  //   } else {
  //     email = _emailFilter.text;
  //   }
  // }

  // void _passwordListen() {
  //   if (_passwordFilter.text.isEmpty) {
  //     password = "";
  //   } else {
  //     password = _passwordFilter.text;
  //   }
  // }

  // LoginForm({
  //   this.email = "",
  //   this.password = "",
  //   this.passwordVisible = false,
  //   this.submitAction,
  //   this.forgotPasswordAction,
  //   this.showPasswordAction,
  // }) {
  //   _emailFilter.addListener(_emailListen);
  //   _passwordFilter.addListener(_passwordListen);
  // }

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
        controller: _emailFilter,
        //  controller: _userPasswordController,
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
              // _passwordVisible = !_passwordVisible;
              // if(this.showPasswordAction != null) {
              //   this.showPasswordAction();
              // }
              // print(this.showPasswordAction);
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
            'Login'.toUpperCase(),
            style: submitButtonStyle,
            ),
          onPressed: _loginPressed
        )
      )
    );
  }


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
  