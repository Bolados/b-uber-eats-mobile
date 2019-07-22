import 'package:flutter/material.dart';
import 'package:oubereats/components/passwordfield/passwordfield.dart';
import 'package:oubereats/screens/loginScreen/loginScreen.dart';
import 'package:oubereats/services/i18n/i18n.dart';

I18n i18n = I18n.getInstance();

TextStyle styleTitle = TextStyle(
  fontWeight: FontWeight.normal,
  fontSize: 14.0,
  color: Colors.black38
);

TextStyle styleTitre = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 30.0,
  color: Colors.black
);

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => new _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;
  final _passwordFieldKey = GlobalKey<FormFieldState<String>>();


  onSubmit(context) {
    // // if(_formKey.currentState.validate()){
    //   _formKey.currentState.save();

    //     print("email: $_email, password: $_password");
    // // }    
    Navigator.of(context).pushNamed(LoginScreen.submitRoute);
  }

  onForgotPassword(context){
    Navigator.of(context).pushNamed(LoginScreen.forgotPasswordRoute);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: '',
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      onSaved: (input) => _email = input,
    );

    final password = PasswordField (
      fieldKey: _passwordFieldKey,
      helperText: 'No more than 8 characters.',
      labelText: 'Password',
      onSaved: (input) => _password = input,
    );
    // TextFormField(
    //   autofocus: false,
    //   initialValue: '',
    //   obscureText: true,
    //   decoration: InputDecoration(
    //     hintText: 'Password',
    //     contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
    //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
    //   ),
    // );

    final submitButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: onSubmit(context),
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Log In', style: TextStyle(color: Colors.white)),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: onForgotPassword(context),
    );

    final form = Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          email,
          password,
          SizedBox(height: 24.0),
          submitButton,
        ]
      )
    );
    
    return Card(
        elevation: 0,
        color: Colors.blue,
        margin: EdgeInsets.only(top: 10),
        child: SizedBox(
          width: double.infinity,          
          height: size.height * 40 / 100,
          child: form,
        ),
          // child: Column(
          //   mainAxisSize: MainAxisSize.min,
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: <Widget>[
          //     Padding( 
          //       padding: EdgeInsets.only(top: 15),
          //       child: Text(
          //         i18n.tr("LOGIN_SCREEN.LOGIN_FORM.TITLE").toUpperCase(),
          //         // style: styleTitle,
          //       ),
          //     ),
          //     Text(
          //         i18n.tr("LOGIN_SCREEN.LOGIN_FORM.TITLE").toUpperCase(),
          //         // style: styleTitle,
          //       ),
          //     TextFormField(
          //       keyboardType: TextInputType.emailAddress,
          //       autofocus: false,
          //       initialValue: '',
          //       decoration: InputDecoration(
          //         hintText: 'Email',
          //         contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          //         // border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          //       ),
          //     ),
          //     TextFormField(
          //       autofocus: false,
          //       initialValue: '',
          //       obscureText: true,
          //       decoration: InputDecoration(
          //         hintText: 'Password',
          //         contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          //         // border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          //       )
          //     ),

          //     Padding(
          //       padding: EdgeInsets.symmetric(vertical: 16.0),
          //       child: RaisedButton(
          //         // shape: RoundedRectangleBorder(
          //         //   borderRadius: BorderRadius.circular(24),
          //         // ),
          //         onPressed: () {
          //           Navigator.of(context).pushReplacementNamed(LoginScreen.success);
          //         },
          //         padding: EdgeInsets.all(12),
          //         color: Colors.lightBlueAccent,
          //         child: Text('Log In', style: TextStyle(color: Colors.white)),
          //       ),
          //     ),
          //     FlatButton(
          //       child: Text(
          //         'Forgot password?',
          //         style: TextStyle(color: Colors.black54),
          //       ),
          //       onPressed: () {},
          //     )

          //   ]
          // ),
        // )
    );
  }
}
