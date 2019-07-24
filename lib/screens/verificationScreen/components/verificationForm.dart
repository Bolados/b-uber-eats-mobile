
import 'package:flutter/material.dart';
import 'package:oubereats/screens/helpers/screenshelpers.dart';
import 'package:oubereats/screens/registerScreen/registerScreen.dart';
import 'package:oubereats/screens/verificationScreen/verificationScreen.dart';
import 'package:oubereats/services/i18n/i18n.dart';

I18n i18n = I18n.getInstance();

class VerificationForm extends StatefulWidget {

  AppBar verificationBar;

  VerificationForm({@required this.verificationBar});

  @override
  _VerificationFormState createState() => new _VerificationFormState();
}


class _VerificationFormState extends State<VerificationForm> {
  
  String _code = "";

  // These functions can self contain any user auth logic required, they all have access to _email and _password

  _submit (BuildContext context) {
    print('The user wants to register with ${_code}');
    if (VerificationScreen.submitRoute.isNotEmpty) {
      Navigator.pushReplacementNamed(context, VerificationScreen.submitRoute);
    }
  }

  final TextEditingController _codeController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _codeController.addListener(_codeListen);
  }

  double getHeight(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.portrait) {
      return size.height - widget.verificationBar.preferredSize.height - 100;
    } 
    return 400;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Container(
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
            ScreensHelpers.sizeWidth(context, 5, 0.05), 
            ScreensHelpers.sizeHeight(context, 15, 0.01), 
            ScreensHelpers.sizeWidth(context, 5, 0.05), 
            ScreensHelpers.sizeHeight(context, 10, 0.01)
          )  ,
          child: Form(
            child: SizedBox(
              width: double.infinity,
              height: getHeight(context),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _codeField(),
                  SizedBox(
                    
                  ),
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


  Widget _codeField() {
    return Container(
      // margin: EdgeInsets.only(top: 5, left: 5, bottom: 5),
      child: TextFormField(
        controller: _codeController,
        // validator:,
        // onSaved: (val) => _email = val,
        // onFieldSubmitted: (val) => _email = val,
        keyboardType: TextInputType.number,
        autofocus: false,
        // initialValue: "",
        decoration: InputDecoration(
          // hintText:  i18n.tr("VERIFICATION_SCREEN.FORM.INPUT.PHONE.HINT"),
          // labelText: i18n.tr("VERIFICATION_SCREEN.FORM.INPUT.PHONE.LABEL"),
        ),
      ),
    );
  }

  Widget _submitButton() {
    return Container(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: double.infinity,    
        height: 50.0,
        child: RaisedButton(
          color: Colors.grey,
          child: Text(
            i18n.tr("VERIFICATION_SCREEN.FORM.ACTIONS.SUBMIT.TITLE").toUpperCase(),
            style: submitButtonStyle,
            ),
          onPressed: () => _submit(context)
        )
      )
    );
  }

  

  void _codeListen() {
    if (_codeController.text.isEmpty) {
      _code = "";
    } else {
      _code = _codeController.text;
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
    fontSize: 16,
    letterSpacing: 2.0
  );


}
  