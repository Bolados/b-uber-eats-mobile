import 'package:flutter/material.dart';
import 'package:oubereats/screens/helpers/screenshelpers.dart';
import 'package:oubereats/screens/loginScreen/loginScreen.dart';
import 'package:oubereats/services/i18n/i18n.dart';

I18n i18n = I18n.getInstance();

class Footer extends StatelessWidget {

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
            ScreensHelpers.sizeWidth(context, 5, 0.03), 
            ScreensHelpers.sizeHeight(context, 15, 0.01), 
            ScreensHelpers.sizeWidth(context, 5, 0.03), 
            ScreensHelpers.sizeHeight(context, 10, 0.01)
          )  ,
        child: SizedBox (
          width: double.infinity,          
          height: (orientation == Orientation.portrait) 
            ? ScreensHelpers.sizeHeight(context, 50, 0.05) 
            : ScreensHelpers.sizeHeight(context, 50, 0.2) ,
          child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _title(),
                _register(context),
              ]
            ),
          )
        )
    );
  }
}

Widget _title() {
  return Container( 
    padding: EdgeInsets.only(right: 10),
    alignment: Alignment.centerRight,
    height: 45,
    child: Text(
      i18n.tr("LOGIN_SCREEN.FOOTER.TITLE"),
      style: styleTitle,
    ),
  );
}


Widget _register(BuildContext context) {
  return InkWell(
      onTap: () {
        _purchaseRegister(context);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 2),
          ),
        ),
        alignment: Alignment.center,
        height: 45,
        child: Text(
          i18n.tr("LOGIN_SCREEN.FOOTER.ACTIONS.REGISTER.TITLE").toUpperCase(),
          style: buttonStyle,
          textAlign: TextAlign.center,
        ),
      )
  );
}

void _purchaseRegister(BuildContext context) {
  print('User want to register');
  if(LoginScreen.registerRoute.isNotEmpty) {
    Navigator.pushNamed(context, LoginScreen.registerRoute);
  }
}



TextStyle buttonStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontStyle: FontStyle.normal,
);

TextStyle styleTitle = TextStyle(
  fontWeight: FontWeight.w600,
  color: Colors.black,
);