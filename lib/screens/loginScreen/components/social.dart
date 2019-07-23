import 'package:flutter/material.dart';
import 'package:oubereats/services/i18n/i18n.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

I18n i18n = I18n.getInstance();

class Social extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(),top: BorderSide(),left: BorderSide(),right: BorderSide(),
        ),
      ),
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        margin: EdgeInsets.all(5),
        child: SizedBox (
          width: double.infinity,          
          height: 150,
          child: Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _title(),
                SizedBox(
                  height: 10.0,
                ),
                // FacebookSignInButton(onPressed: () {}),
                _social('Facebook')
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
    padding: EdgeInsets.all(0),
    alignment: Alignment.center,
    child: Text(
      i18n.tr("LOGIN_SCREEN.SOCIAL.TITLE").toUpperCase(),
      style: styleTitle,
    ),
  );
}

Widget _social(String kind) {
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.all(30),
    child: SizedBox(
      width: double.infinity,    
      height: 45.0,
      child: FlatButton.icon(
        color: Colors.redAccent,
        icon: Icon(FontAwesomeIcons.facebook),
        label: Text(
          i18n.tr("LOGIN_SCREEN.SOCIAL.ACTIONS.TITLE",args: [kind]),
          style: buttonStyle,
          ),
        onPressed: () => _purchaseSocial(kind),
      )
    )
  );
}

void _purchaseSocial(String kind) {
  print('User want to continue with Facebook $kind Network');
}



TextStyle buttonStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w400,
  fontStyle: FontStyle.normal,
  letterSpacing: 2.0
);

TextStyle styleTitle = TextStyle(
  fontWeight: FontWeight.w400,
  color: Colors.black,
);