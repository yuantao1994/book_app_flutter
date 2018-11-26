import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

class MyBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Icon(
                Icons.open_in_browser,
                size: 190.0,
                color: Colors.green,
              ),
              new Text(
                'MyBook',
                style: new TextStyle(color: Colors.green),
              )
            ],
          ),
        ),
      ),
    );
  }
}
