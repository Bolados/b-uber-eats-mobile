

import 'package:flutter/material.dart';
import 'package:oubereats/services/i18n/i18n.dart';

I18n i18n = I18n.getInstance();

class VerificationBar {
  BuildContext context;
  VerificationBar({@required this.context});
  
  
  Widget buildBar(){
    Size size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return AppBar (
        backgroundColor: Color.fromRGBO(252, 245, 233, 1),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight((orientation == Orientation.portrait) ? 60 : 55),
          child: Container(
            child: Card(
              elevation: 0,
              color: Colors.transparent,
              child: Row (
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _title(context),
                  _icon(context),            
                ]
              )
            )
          ), 
        ),
      );
  }  

  

  Widget _title(context) {
    return 
    Expanded (
      child: 
      ListTile(
        title: Text(
          i18n.tr("VERIFICATION_SCREEN.HEADER_BAR.TITLE").toUpperCase(),
          style: styleTitle,
        ),
        subtitle: Text(
          i18n.tr("VERIFICATION_SCREEN.HEADER_BAR.SUB_TITLE",args: ['9876543210']),
          maxLines: 2,
          style: styleSubtitle,
        ),
        contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0),
        
      ),
    );
  }


  Widget _icon(context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 25, 20),
      child: 
      Image.asset(
        'assets/icons/smartphone.png',
        width: 40,
        height: 40,
        fit: BoxFit.fill,
      ),
    );
  }

  TextStyle styleTitle = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontSize: 20,
    letterSpacing: 1,
    wordSpacing: 1
  );

  TextStyle styleSubtitle = TextStyle(
    // color: Colors.black,
  );

}

