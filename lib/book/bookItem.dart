import 'package:book_app/book/bookDetails.dart';
import 'package:book_app/book/reader.dart';
import 'package:book_app/model/bookInfo.dart';
import 'package:flutter/material.dart';

class BookListItem extends StatelessWidget {
  final BookInfo _book;

  BookListItem(this._book);

  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: const EdgeInsets.only(bottom: 35.0),
        child: new ListTile(
          //   leading:new Image(),
          leading: new Image.asset(
            'img/like.jpg',
            width: 80.0,
            height: 100.0,
            fit: BoxFit.cover,
          ),
          title: new Text(
            _book.name,
            style: new TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: new Row(
            children: [
              new Expanded(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    new Container(
                      padding: const EdgeInsets.only(bottom: 3.0, top: 3.0),
                      child: new Text(
                        _book.author + " | " + _book.type,
                      ),
                    ),
                    new Text(
                      _book.sub,
                      overflow: TextOverflow.ellipsis,
                      style: new TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          onTap: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (BuildContext context) {
              return new Reader(_book);
//              return new BookDetails(_book);
            }));
          },
        ));
  }

  goDetials(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute<void>(builder: (BuildContext context) {
      return new BookDetails(this._book);
    }));
  }
}
