

import 'package:flutter/material.dart';

class VerificationBar {
  BuildContext context;
  VerificationBar({@required this.context});
  
  
  Widget buildBar(){
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
          preferredSize: Size.fromHeight(100.0),
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0,25),
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
    return Expanded (
      child: ListTile(
        title: Text(
          'Verify Number'.toUpperCase(),
          style: styleTitle,
        ),
        subtitle: Text(
          'OTP send to {xxxxxxxx} ',
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
        color: Colors.transparent,
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

