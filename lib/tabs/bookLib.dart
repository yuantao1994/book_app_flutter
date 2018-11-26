import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

class BookLib extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListExamplePage(),
    );
  }
}

class ListExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new ListView.builder(
      itemBuilder: (BuildContext context, int position) =>
          // Try using either _getRowWithDivider or _getRowWithBoxDecoration
          // for two different ways of rendering a divider
          _getRowWithDivider(position),
    ));
  }

  /// Returns the widget at position i in the list, separated using a divider
  Widget _getRowWithDivider(int i) {
    var children = <Widget>[
      new Padding(padding: new EdgeInsets.all(10.0), child: new Text('Row $i')),
      new Divider(height: 5.0),
    ];

    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }

// Returns the widget at position i in the list, separated using a BoxDecoration
  Widget _getRowWithBoxDecoration(int i) {
    return new Container(
        decoration: new BoxDecoration(
            border:
                new Border(bottom: new BorderSide(color: Colors.grey[100]))),
        child: new Padding(
            padding: new EdgeInsets.all(10.0), child: new Text('Row $i')));
  }
}
