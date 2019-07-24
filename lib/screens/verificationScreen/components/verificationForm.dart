
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:oubereats/screens/helpers/screenshelpers.dart';
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
    print('The user wants to register with $_code');
    if (_code.isNotEmpty && VerificationScreen.submitRoute.isNotEmpty) {
      while(Navigator.canPop(context)){
        Navigator.pop(context);
      }
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
      return size.height - widget.verificationBar.preferredSize.height - 65;
    } 
    return 250;
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
                  SizedBox(
                    height: 20,
                  ),
                  _codeField(context),
                  Expanded(
                    child: _submitButton(context),
                  ),
                ]
              )
            ),
          )
        // )
      )
    );
  }

  Widget _codeField(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Container(
      alignment: Alignment.center,
      padding: (orientation == Orientation.portrait) 
          ? EdgeInsets.fromLTRB(
            ScreensHelpers.sizeWidth(context, 25, 0.01), 
            ScreensHelpers.sizeHeight(context, 10, 0.01), 
            ScreensHelpers.sizeWidth(context, 25, 0.01), 
            ScreensHelpers.sizeHeight(context, 10, 0.01)
          ) 
          : EdgeInsets.fromLTRB(
            ScreensHelpers.sizeWidth(context, 25, 0.1), 
            ScreensHelpers.sizeHeight(context, 10, 0.01), 
            ScreensHelpers.sizeWidth(context, 25, 0.1), 
            ScreensHelpers.sizeHeight(context, 10, 0.01)
          )  ,
      child: PinPut(
          fieldsCount: 4,
          onSubmit: (String pin) {
            _code = pin;
          },
          actionButtonsEnabled: false,
          inputDecoration: InputDecoration(
            border: const UnderlineInputBorder(),
            counterText: ''
          ),
        ),
    );
  }

  Widget _submitButton(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Container(
      alignment: Alignment.bottomCenter,
      padding: (orientation == Orientation.portrait) 
          ? EdgeInsets.fromLTRB(
            ScreensHelpers.sizeWidth(context, 5, 0.01), 
            ScreensHelpers.sizeHeight(context, 10, 0.01), 
            ScreensHelpers.sizeWidth(context, 5, 0.01), 
            ScreensHelpers.sizeHeight(context, 10, 0.01)
          ) 
          : EdgeInsets.fromLTRB(
            ScreensHelpers.sizeWidth(context, 5, 0.1), 
            ScreensHelpers.sizeHeight(context, 10, 0.01), 
            ScreensHelpers.sizeWidth(context, 5, 0.1), 
            ScreensHelpers.sizeHeight(context, 10, 0.01)
          )  ,
      child: SizedBox(
        width: double.infinity,    
        height: 50.0,
        child: RaisedButton(
          color: Colors.green,
          child: Text(
            i18n.tr("VERIFICATION_SCREEN.FORM.ACTIONS.SUBMIT.TITLE").toUpperCase(),
            style: submitButtonStyle,
            ),
          onPressed: () => _submit(context),
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

  TextStyle submitButtonStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    fontSize: 24,
    letterSpacing: 2.0
  );


}
  