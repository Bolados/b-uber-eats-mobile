import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double delta = 10 / 100;
    return 
      Align(
        alignment: Alignment.bottomCenter,
        child:  Padding (
          padding: EdgeInsets.only(bottom: size.height * delta),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                "INDIA'S FASTEST GROWING",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12.0,
                  color: Colors.white
                )
              ),
              Text(
                "FOOD DELIVERY PLATFORM",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12.0,
                  color: Colors.white
                )
              ),
            ],
          ),
        ),
      );
  }
}