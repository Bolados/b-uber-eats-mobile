import 'package:flutter/material.dart';
import 'package:oubereats/screens/helpers/screenshelpers.dart';
import 'package:oubereats/screens/loginScreen/loginScreen.dart';
import 'package:oubereats/services/i18n/i18n.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:enum_to_string/enum_to_string.dart';

I18n i18n = I18n.getInstance();

class Social extends StatelessWidget {

  
void _purchaseSocial(_Kind kind, BuildContext context) {
  print('User want to continue with Facebook $kind Network');
  if (LoginScreen.submitRoute.isNotEmpty) {
      Navigator.pushReplacementNamed(context, LoginScreen.submitRoute);
    }
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
            ScreensHelpers.sizeWidth(context, 30, 0.01), 
            ScreensHelpers.sizeHeight(context, 5, 0), 
            ScreensHelpers.sizeWidth(context, 30, 0.01), 
            ScreensHelpers.sizeHeight(context, 0, 0)
          ) 
          : EdgeInsets.fromLTRB(
            ScreensHelpers.sizeWidth(context, 30, 0.2), 
            ScreensHelpers.sizeHeight(context, 10, 0.01), 
            ScreensHelpers.sizeWidth(context, 30, 0.2), 
            ScreensHelpers.sizeHeight(context, 0, 0)
          )  ,
        child: SizedBox (
          width: double.infinity,          
          height: (orientation == Orientation.portrait) 
            ? ScreensHelpers.sizeHeight(context, 160, 0.25) 
            : ScreensHelpers.sizeHeight(context, 160, 0.5) ,
          child: Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _title(),
                SizedBox(
                  height: 10.0,
                ),
                // FacebookSignInButton(onPressed: () {}),
                _social(context, _Kind.Facebook),
                _social(context, _Kind.Google),
              ]
            ),
          )
        )
      )
    );
  }
}

Widget _title() {
  return Container( 
    padding: EdgeInsets.only(top: 10, bottom: 5),
    alignment: Alignment.center,
    child: Text(
      i18n.tr("LOGIN_SCREEN.SOCIAL.TITLE").toUpperCase(),
      style: styleTitle,
    ),
  );
}

enum _Kind {
  Facebook, 
  Google

}

Color _socialColor(_Kind kind) {
  switch (kind) {
    case _Kind.Facebook:
      return Colors.blue[900];
    case _Kind.Google:
      return Colors.red[900];
    default:
      break;
  }
  return Colors.transparent;
}

IconData _socialIcon(_Kind kind) {
  switch (kind) {
    case _Kind.Facebook:
      return FontAwesomeIcons.facebookF;
    case _Kind.Google:
      return FontAwesomeIcons.googlePlusG;
    default:
      break;
  }
  return null;
}



Widget _social(BuildContext context, _Kind kind) {
  Size size = MediaQuery.of(context).size;
  Orientation orientation = MediaQuery.of(context).orientation;
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.only(top: 10),
    child: SizedBox(
      width: double.infinity,    
      height: 45.0,
      child: RaisedButton(
        color: _socialColor(kind),
        padding: EdgeInsets.only(left: 15),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(
              _socialIcon(kind),
              color: Colors.white
            ),
            (orientation == Orientation.portrait) 
            ? SizedBox(width: 20) 
            : SizedBox(width: 40),
            Padding ( 
              padding: EdgeInsets.only(top: 3),
              child: Text(
              i18n.tr("LOGIN_SCREEN.SOCIAL.ACTIONS.TITLE",args: [EnumToString.parse(kind)]),
              style: buttonStyle,
              )

            ),
          ],
        ),
        onPressed: () => _purchaseSocial(kind, context),
      )
    )
  );
}



TextStyle buttonStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w400,
  fontStyle: FontStyle.normal,
  letterSpacing: 2.0
);

TextStyle styleTitle = TextStyle(
  fontWeight: FontWeight.w600,
  color: Colors.black,
);