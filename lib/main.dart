import 'package:book_app/book/bookDetails.dart';

import 'tabs/bookLib.dart';
import 'tabs/my.dart';
import 'tabs/myBook.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

void main() => runApp(MaterialApp(
      home: LayoutTab(),
      routes: <String, WidgetBuilder>{
        '/bookDetails': (BuildContext context) => BookDetails(null),
      },
    ));

class LayoutTab extends StatefulWidget {
  @override
  _BottomTabState createState() => _BottomTabState();
}

class _BottomTabState extends State<LayoutTab>
    with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    super.initState();
    // Initialize the Tab Controller
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Using Bottom Navigation Bar'),
        backgroundColor: Colors.blue,
      ),
      body: new TabBarView(
        children: <Widget>[new MyBook(), new BookLib(), new MyInfo()],
        controller: controller,
      ),
      bottomNavigationBar: new Material(
        color: Colors.blue,
        child: new TabBar(
          tabs: <Tab>[
            new Tab(
              icon: new Icon(Icons.home),
              text: "Home",
            ),
            new Tab(icon: new Icon(Icons.android), text: "android"),
            new Tab(
              icon: new Icon(Icons.iso),
              text: "iOS",
            )
          ],
          controller: controller,
        ),
      ),
    );
  }
}
