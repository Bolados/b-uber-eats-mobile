import 'package:flutter/material.dart';
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

class LoginFormParam {
  String email;
  String password;
  bool passwordVisible = false;
  VoidCallback onSubmit;
  VoidCallback onForgotPassword;
  LoginFormParam(
    this.email,
    this.password,
    this.passwordVisible,
    this.onSubmit,
    this.onForgotPassword
  );
}


class LoginForm extends StatelessWidget {

  final LoginFormParam param;

  LoginForm({
    @required this.param
  });
  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Widget title = Padding( 
      padding: EdgeInsets.only(top: 15),
      child: Text(
        i18n.tr("LOGIN_SCREEN.LOGIN_FORM.TITLE").toUpperCase(),
        // style: styleTitle,
      ),
    );

    Widget email = TextFormField(
      //  controller: _userPasswordController,
      // validator:,
      onSaved: (val) => param.email = val,
      onFieldSubmitted: (val) => param.email = val,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: '',
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    Widget password = TextFormField(
      keyboardType: TextInputType.text,
      //  controller: _userPasswordController,
      // validator:,
      onSaved: (val) => param.password = val,
      onFieldSubmitted: (val) => param.password = val,
      obscureText: param.passwordVisible,//This will obscure text dynamically
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        // Here is key idea
        suffixIcon: IconButton(
          icon: Icon(
            // Based on passwordVisible state choose the icon
            param.passwordVisible
            ? Icons.visibility
            : Icons.visibility_off,
            // color: Theme.of(context).primaryColorDark,
            ),
          onPressed: () {
            // Update the state i.e. toogle the state of passwordVisible variable
            param.passwordVisible = !param.passwordVisible;
            // setState(() {
            //     parent.
            // });
          },
        ),
      ),
    );

    Widget submitButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: param.onSubmit,
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Log In', style: TextStyle(color: Colors.white)),
      ),
    );

    Widget forgotLabel = FlatButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {
        if (param.onForgotPassword != null) {
          param.onForgotPassword();
        }
        print("pressed");
      },
    );

    final form = Form(
      // key: _formKey,
      child: Column(
        children: <Widget>[
          email,
          password,
          submitButton,
          forgotLabel
        ]
      )
    );
    print(param);
    return Card(
        elevation: 0,
        color: Colors.blue,
        margin: EdgeInsets.only(top: 10),
        child: SizedBox(
          width: double.infinity,          
          height: size.height * 40 / 100,
        //   child: form,
        // ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              title,
              form,
              // TextFormField(
              //   keyboardType: TextInputType.emailAddress,
              //   autofocus: false,
              //   initialValue: '',
              //   decoration: InputDecoration(
              //     hintText: 'Email',
              //     contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              //     // border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
              //   ),
              // ),
              // TextFormField(
              //   autofocus: false,
              //   initialValue: '',
              //   obscureText: true,
              //   decoration: InputDecoration(
              //     hintText: 'Password',
              //     contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              //     // border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
              //   )
              // ),

              // Padding(
              //   padding: EdgeInsets.symmetric(vertical: 16.0),
              //   child: RaisedButton(
              //     // shape: RoundedRectangleBorder(
              //     //   borderRadius: BorderRadius.circular(24),
              //     // ),
              //     onPressed: onSubmit(context),
              //     padding: EdgeInsets.all(12),
              //     color: Colors.lightBlueAccent,
              //     child: Text('Log In', style: TextStyle(color: Colors.white)),
              //   ),
              // ),
              // FlatButton(
              //   child: Text(
              //     'Forgot password?',
              //     style: TextStyle(color: Colors.black54),
              //   ),
              //   onPressed: () {},
              // )

            ]
          ),
        )
    );
  }
}
