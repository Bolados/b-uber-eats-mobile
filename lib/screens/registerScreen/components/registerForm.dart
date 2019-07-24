
import 'package:flutter/material.dart';
import 'package:oubereats/screens/helpers/screenshelpers.dart';
import 'package:oubereats/screens/loginScreen/loginScreen.dart';
import 'package:oubereats/screens/registerScreen/registerScreen.dart';
import 'package:oubereats/services/i18n/i18n.dart';

I18n i18n = I18n.getInstance();

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => new _RegisterFormState();
}


class _RegisterFormState extends State<RegisterForm> {
  
  String _phone = "";
  String _username = "";
  String _email = "";
  String _password = "";
  bool _passwordVisible = false;
  bool _haveReferCode = false;
  String _referCode = "";

  // These functions can self contain any user auth logic required, they all have access to _email and _password

  _submit (BuildContext context) {
    print('The user wants to register with ${_email}, ${_password}, ${_phone}, ${_username}, ${_haveReferCode}, ${_referCode}, ');
    if (RegisterScreen.submitRoute.isNotEmpty) {
      Navigator.pushNamed(context, RegisterScreen.submitRoute);
    }
  }

  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _phoneController = new TextEditingController();
  final TextEditingController _usernameController = new TextEditingController();
  final TextEditingController _referCodeController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_emailListen);
    _passwordController.addListener(_passwordListen);
    _phoneController.addListener(_phoneListen);
    _usernameController.addListener(_usernameListen);
    _referCodeController.addListener(_referCodeListen);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Container(
      decoration: BoxDecoration(
        border: Border.all()
      ),
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        margin: (orientation == Orientation.portrait) 
          ? EdgeInsets.fromLTRB(
            ScreensHelpers.sizeWidth(context, 5, 0.01), 
            ScreensHelpers.sizeHeight(context, 15, 0.01), 
            ScreensHelpers.sizeWidth(context, 5, 0.01), 
            ScreensHelpers.sizeHeight(context, 10, 0.01)
          ) 
          : EdgeInsets.fromLTRB(
            ScreensHelpers.sizeWidth(context, 5, 0.03), 
            ScreensHelpers.sizeHeight(context, 15, 0.01), 
            ScreensHelpers.sizeWidth(context, 5, 0.03), 
            ScreensHelpers.sizeHeight(context, 10, 0.01)
          ),
          child: Form(
            child: SizedBox(
              width: double.infinity,
              height: (orientation == Orientation.portrait) ? size.height - 150 - 100 : 400,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _phoneField(),
                  _usernameField(),
                  _emailField(),
                  _passwordField(),
                  _referCodeCheckbox(),
                  _referCodeField() ,
                  Expanded(
                    child: _submitButton(),
                  ),
                ]
              )
            ),
          )
        // )
      )
    );
  }

  Widget _fields(context) {

  }


  Widget _phoneField() {
    return Container(
      // margin: EdgeInsets.only(top: 5, left: 5, bottom: 5),
      child: TextFormField(
        controller: _phoneController,
        // validator:,
        // onSaved: (val) => _email = val,
        // onFieldSubmitted: (val) => _email = val,
        keyboardType: TextInputType.number,
        autofocus: false,
        // initialValue: "",
        decoration: InputDecoration(
          hintText:  i18n.tr("REGISTER_SCREEN.FORM.INPUT.PHONE.HINT"),
          labelText: i18n.tr("REGISTER_SCREEN.FORM.INPUT.PHONE.LABEL"),
        ),
      ),
    );
  }

  Widget _emailField() {
    return Container(
      // margin: EdgeInsets.only(left: 5),
      child: TextFormField(
        controller: _emailController,
        // validator:,
        // onSaved: (val) => _email = val,
        // onFieldSubmitted: (val) => _email = val,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        // initialValue: "",
        decoration: InputDecoration(
          hintText:  i18n.tr("REGISTER_SCREEN.FORM.INPUT.EMAIL.HINT"),
          labelText: i18n.tr("REGISTER_SCREEN.FORM.INPUT.EMAIL.LABEL"),  
        ),
      ),
    );
  }
  

  Widget _usernameField() {
    return Container(
      // margin: EdgeInsets.only(top: 10, left: 5),
      child: TextFormField(
        controller: _usernameController,
        // validator:,
        // onSaved: (val) => _email = val,
        // onFieldSubmitted: (val) => _email = val,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        // initialValue: "",
        decoration: InputDecoration(
          hintText:  i18n.tr("REGISTER_SCREEN.FORM.INPUT.USERNAME.HINT"),
          labelText: i18n.tr("REGISTER_SCREEN.FORM.INPUT.USERNAME.LABEL"),
        ),
      ),
    );
  }

   Widget _referCodeCheckbox() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row (
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Transform.scale(
            scale: 1.5,
            alignment: Alignment.centerRight,
            child: Checkbox(
              value: _haveReferCode,
              onChanged: (bool value) => _changeHaveReferCode(value),
            )
          ),
          Expanded(
            child: Container(
              transform: Matrix4.translationValues(-15.0, 0.0, 0.0),
              child: Text(
                i18n.tr("REGISTER_SCREEN.FORM.CHECKBOX.REFER_CODE.LABEL"),
              )
            ),
          )
        ],
      )
    );
  }

  Widget _referCodeField() {
    if(!_haveReferCode) {
      return Container();
    }
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: TextFormField(
        controller: _usernameController,
        // validator:,
        // onSaved: (val) => _email = val,
        // onFieldSubmitted: (val) => _email = val,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        // initialValue: "",
        decoration: InputDecoration(
          hintText:  i18n.tr("REGISTER_SCREEN.FORM.INPUT.REFER_CODE.HINT"),
          labelText: i18n.tr("REGISTER_SCREEN.FORM.INPUT.REFER_CODE.LABEL"),          
          contentPadding: EdgeInsets.only(bottom: 2),
        ),
      ),
    );
  }
  

  Widget _passwordField() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: TextFormField(
        keyboardType: TextInputType.text,
        controller: _passwordController,
        // validator:,
        // onSaved: (val) => _password = val,
        // onFieldSubmitted: (val) => _password = val,
        obscureText: !_passwordVisible, //This will obscure text dynamically
        decoration: InputDecoration(
          hintText:  i18n.tr("REGISTER_SCREEN.FORM.INPUT.PASSWORD.HINT"),
          labelText: i18n.tr("REGISTER_SCREEN.FORM.INPUT.PASSWORD.LABEL"),
          contentPadding: EdgeInsets.only(bottom: 2),
          suffixIcon: IconButton(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 0),
            icon: Icon(
              _passwordVisible
              ? Icons.visibility
              : Icons.visibility_off,
              color: Colors.grey,
            ),
            tooltip: i18n.tr("REGISTER_SCREEN.FORM.ACTIONS.HIDE_SHOW_PASSWORD.TOOLTIP"),
            onPressed: _togglePasswordVisibility,
          ),
        ),
      )
    );
  }

  Widget _submitButton() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all()
      ),
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: double.infinity,    
        height: 50.0,
        child: RaisedButton(
          color: Colors.grey,
          child: Text(
            i18n.tr("REGISTER_SCREEN.FORM.ACTIONS.SUBMIT.TITLE").toUpperCase(),
            style: submitButtonStyle,
            ),
          onPressed: () => _submit(context)
        )
      )
    );
  }

  void _togglePasswordVisibility () {
    setState(() {
        _passwordVisible = !_passwordVisible;
    });
  }

  bool _changeHaveReferCode (value) {
    setState(() {
        _haveReferCode = value;
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

  void _usernameListen() {
    if (_usernameController.text.isEmpty) {
      _username = "";
    } else {
      _username = _usernameController.text;
    }
  }

  void _phoneListen() {
    if (_phoneController.text.isEmpty) {
      _phone = "";
    } else {
      _phone = _phoneController.text;
    }
  }

  void _referCodeListen() {
    if (_referCodeController.text.isEmpty) {
      _referCode = "";
    } else {
      _referCode = _referCodeController.text;
    }
  }

  TextStyle styleTitle = TextStyle(
    fontWeight: FontWeight.w600,
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
  