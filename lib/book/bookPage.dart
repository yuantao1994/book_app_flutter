import 'package:book_app/book/bookList.dart';
import 'package:book_app/model/bookInfo.dart';
import 'package:flutter/material.dart';

class BookPage extends StatelessWidget {
  _buildContactList() {
    return <BookInfo>[
      BookInfo(
          id: "1",
          name: "斗破苍穹",
          cover: "",
          author: "土豆",
          sub: "这是一个三十岁",
          type: "玄幻"),
      BookInfo(
          id: "2",
          name: "斗破苍穹2",
          cover: "",
          author: "土豆2",
          sub: "这是一个三2岁这是一个三2岁这是一个三2岁这是一个三2岁这是一个三2岁",
          type: "玄幻"),
      BookInfo(
          id: "3",
          name: "斗破苍穹3",
          cover: "",
          author: "土豆",
          sub: "这是一个三十岁",
          type: "玄幻"),
      BookInfo(
          id: "4",
          name: "斗破苍穹4",
          cover: "",
          author: "土豆",
          sub: "这是一个三十岁这是一个三十岁这是一个三十岁这是一个三十岁这是一个三十岁",
          type: "玄幻"),
      BookInfo(
          id: "5",
          name: "斗破苍穹5",
          cover: "",
          author: "土豆",
          sub: "这是一个三十岁",
          type: "玄幻"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: new BooksList(_buildContactList()));
  }
}
