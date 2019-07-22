
import 'package:flutter/material.dart';
import 'package:oubereats/screens/loginScreen/components/header.dart';

class Body extends StatelessWidget {
  final List<String> _listViewData = [
    "1 A List View with many Text - Here's one!",
    "2 A List View with many Text - Here's another!",
    "3 A List View with many Text - Here's more!",
    "4 A List View with many Text - Here's more!",
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(8.0),
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 5.0,
        children: _listViewData
          .map(
            (data) => Card(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(data),
                  )
                ),
              )
          ).toList(),
      // ),
    // return Stack (
    //     children: <Widget>[
    //       Header(),
    //       // Footer()
    //     ]
      );
  }
}