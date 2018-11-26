import 'package:book_app/book/bookItem.dart';
import 'package:book_app/model/bookInfo.dart';
import 'package:flutter/material.dart';

class BooksList extends StatelessWidget {
  final List<BookInfo> _bookInfo;

  BooksList(this._bookInfo);

  @override
  Widget build(BuildContext context) {
    return new ListView(
        padding: new EdgeInsets.symmetric(vertical: 30.0),
        children: _buildContactsList());
  }

  List<BookListItem> _buildContactsList() {
    return _bookInfo.map((contact) => new BookListItem(contact)).toList();
  }
}

/* 
class BookRows extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Row(
      
    )
  }

} */
