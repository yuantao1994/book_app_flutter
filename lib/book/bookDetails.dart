import 'package:book_app/model/bookInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookDetails extends StatelessWidget {
  final BookInfo _book;

  BookDetails(this._book);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text("详细信息")),
      body: new Container(
          child: new ListView(
        children: <Widget>[
          new BookBtn(_book),
          new CatalogWidget(_book),
          new BookText(_book),
        ],
      )),
    );
  }
}

class CatalogWidget extends StatelessWidget {
  final BookInfo _book;

  CatalogWidget(this._book);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            leading: Icon(Icons.format_align_justify),
            title: Text('最近更新：2018-11-27'),
            subtitle: Text('第两百三十章：从此是是是'),
          ),
        ],
      ),
    );
  }
}

class BookText extends StatelessWidget {
  final BookInfo _book;

  BookText(this._book);
  @override
  Widget build(BuildContext context) {
    return new Card(
        child: new Column(
      children: <Widget>[
        new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 50.0, bottom: 8.0),
                  child: new Column(
                    children: <Widget>[
                      new Text("追书人数"),
                      new Text("900"),
                    ],
                  ),
                ),
                new Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 50.0, bottom: 8.0),
                  child: new Column(
                    children: <Widget>[
                      new Text("读者存留率"),
                      new Text("50.6"),
                    ],
                  ),
                ),
                new Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 50.0, bottom: 8.0),
                  child: new Column(
                    children: <Widget>[
                      new Text("更新字数/天"),
                      new Text("9000"),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        new Column(
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.all(20.0),
              child: new Text(
                "市二中的金牌老师孙默落水后，来到了中州唐国，成了一个刚毕业的实习老师，竟然有了一个白富美的未婚妻，未婚妻竟然还是一所名校的校长，不过这名校衰败了，即将摘牌除名，进行废校处理……孙默的开局，就是要帮助未婚妻坐稳校长之位，让学校重回豪门之列。孙默得到绝代名师系统后，点废成金，把一个个废物变成了天才，在孙默的指导下，学渣们一年学霸，三年学帝，五年学神，很快可以变成王者级的大BOSS！竟敢说我这名师徒有虚名？剑豪、枪圣，刀魔，圣女，无双国士，一代魔帝，两大圣人，三大至尊，统统都是我教出来的，就问你怕不怕？我最喜欢把青铜杂鱼带成王者BOSS，孙默如是说！",
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.6,
                ),
              ),
            )
          ],
        )
      ],
    ));
  }
}

class BookBtn extends StatelessWidget {
  final BookInfo _book;
  BookBtn(this._book);
  @override
  Widget build(BuildContext context) {
    return Card(
      //   color: Colors.white70,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.only(top: 10.0, left: 10.0),
            isThreeLine: true,
            dense: false,
            leading: new Image.asset(
              'img/like.jpg',
              width: 100.0,
              height: 150.0,
            ),
            title: Text(this._book.name),
            subtitle: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Container(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(_book.author + " | " + _book.type + " | 750万字"),
                ),
                new Container(
                  padding: EdgeInsets.only(top: 10.0),
                  child: new Text('已完结'),
                ),
              ],
            ),
          ),
          ButtonTheme.bar(
            // make buttons use the appropriate styles for cards
            child: ButtonBar(
              children: <Widget>[
                CupertinoButton(
                  minSize: 20.0,
                  color: Colors.black26,
                  child: Text(
                    '收藏',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {/* ... */},
                ),
                CupertinoButton(
                  minSize: 20.0,
                  color: Colors.lightBlue,
                  child: Text('开始阅读'),
                  onPressed: () {/* ... */},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
