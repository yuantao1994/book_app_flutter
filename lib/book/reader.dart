import 'dart:async';
import 'package:book_app/model/bookInfo.dart';
import 'package:flutter/material.dart';

class Reader extends StatefulWidget {
  Reader(this.book);

  /// the book be read
  final BookInfo book;

  _ReaderState createState() => new _ReaderState();
}

class _ReaderState extends State<Reader> {
  /// the ratio to slice the screen
  Map<String, List<int>> tapRatio = <String, List<int>>{
    'x': [1, 1, 1],
    'y': [1, 1, 1]
  };

  /// the area tapped
  Map<String, double> tapGrid = <String, double>{};

  /// the size of screen
  Size mediaSize;

  bool isShowMenu = false;

  /// 翻页控制器
  PageController controller;

  ///
  PageController pageController;

  Future<PageController> pageControllerFuture;

  SliverChildBuilderDelegate childBuilderDelegate;

  /// 页码切换
  /// next=true: 下一页
  /// next=false: 上一页
  void handlePageChanged(bool next) {
    if (next) {
      // 下一页
//      print('下一页');
      /*  if (!hasNextPage) {
        print('最后一页了');
        return;
      } */

      controller.nextPage(
          duration: const Duration(milliseconds: 1), curve: Curves.easeInOut);
    } else {
      // 上一页
//      print('上一页');
      controller.previousPage(
          duration: const Duration(milliseconds: 1), curve: Curves.easeInOut);
    }
  }

  /// tu show menu
  Future<Null> handleShowMenu() async {
    return;
  }

  ///记录点击坐标详情
  TapDownDetails tapDownDetails;

  ///处理点击事件
  void handleTapDown(TapDownDetails details) {
    tapDownDetails = details;
  }

  /// detect tap event
  void handleTapUp(TapUpDetails tapUpDetails) {
    double x = tapUpDetails.globalPosition.dx;
    double y = tapUpDetails.globalPosition.dy;
    if (tapGrid.isEmpty) {
      double x1 = size.width *
          (tapRatio['x'][0] /
              (tapRatio['x'][0] + tapRatio['x'][1] + tapRatio['x'][2]));
      double x2 = size.width *
          ((tapRatio['x'][0] + tapRatio['x'][1]) /
              (tapRatio['x'][0] + tapRatio['x'][1] + tapRatio['x'][2]));
      double y1 = size.height *
          (tapRatio['y'][0] /
              (tapRatio['y'][0] + tapRatio['y'][1] + tapRatio['y'][2]));
      double y2 = size.height *
          ((tapRatio['y'][0] + tapRatio['y'][1]) /
              (tapRatio['y'][0] + tapRatio['y'][1] + tapRatio['y'][2]));
      tapGrid['x1'] = x1;
      tapGrid['x2'] = x2;
      tapGrid['y1'] = y1;
      tapGrid['y2'] = y2;
    }
    if (x <= tapGrid['x1']) {
      // previous page
      handlePageChanged(false);
    } else if (x >= tapGrid['x2']) {
      // next page
      handlePageChanged(true);
    } else {
      if (y <= tapGrid['y1']) {
        // previous page
        handlePageChanged(false);
      } else if (y >= tapGrid['y2']) {
        // next page
        handlePageChanged(true);
      } else {
        // open the menu
        isShowMenu = true;
        handleShowMenu().then((value) {
          if (true == value) {}
        });
      }
    }
  }

  ThemeData get theme {
    return Theme.of(context);
  }

  TextStyle get waitingTextStyle {
    return theme.textTheme.body2.copyWith(color: Colors.white70);
  }

  Future<void> _neverSatisfied() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Rewind and remember'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('You will never be satisfied.'),
                Text('You\’re like me. I’m never satisfied.'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Regret'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget pageBuilder(BuildContext contxt, int index) {
    return new Container(
      decoration: new BoxDecoration(
        color: Colors.white70,
        //  image: lightEngine.style.image,
      ),
      padding: const EdgeInsets.only(
        top: 20.0,
        left: 10.0,
        right: 10.0,
        bottom: 5.0,
      ),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
            height: 30.0,
            child: new Row(
              children: <Widget>[
                new Text('三生药'),
              ],
            ),
          ),
          new Expanded(
            child: GestureDetector(
              onTapUp: handleTapUp,
              onTapDown: handleTapDown,
              child: new Container(
                padding: EdgeInsets.all(10.0),
                color: Colors.white,
                child: new Text(
                  // lightEngine.getContent(index),
                  getPageCont(index),
                  style: getTextStyle(),
                  overflow: TextOverflow.clip,
                  //    maxLines: lightEngine.maxLines,
                  //   textScaleFactor: 1.0,
                ),
              ),
            ),
          ),
          new SizedBox(
            height: 30.0,
            child: new Row(
              children: <Widget>[
                new Text((index + 1).toString() + "/" + pageCount.toString()),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    /// 翻页控制器
    controller = new PageController();
    // lightEngine = new LightEngine(book: widget.book, stateSetter: setState);
  }

  int pageCount = 1;

  String str =
      "三生药，那是什么？楚风狐疑，接近到眼前、都几乎能够感受到对方冰冷气息的生物竟在喃喃着一种药物的名字？\r\n\r\n    不过虽有疑惑，但现在楚风更多的是发毛，实在太被动了，生死皆不掌握在自己的手中。\r\n\r\n    觅食者要是给他来一下，楚风严重怀疑，便是动用轮回土与黑色小木矛都不见得能挡住。\r\n\r\n    他不敢轻举妄动，不到不万不得已，他不愿取出筷子长的黑色小木矛这种大杀器，除非没得选择了。\r\n\r\n    甚至，他都没有睁开火眼金睛，怕刺激这个觅食者。\r\n\r\n    大雾很浓，无边无际，将整片雍州阵营都覆盖了，数以百万计的进化者都在退走，都在逃离此地。\r\n\r\n    但是，现在楚风走不了，被锁定了，被这种莫名的生物盯上了。\r\n\r\n    不远处，齐嵘僵硬在地上，但毕竟是一代天尊，片刻后他就复苏了，睁开眼后就要遁走。\r\n\r\n    然而，还没有等他起身，觅食者嗷的一声，凄厉的嚎叫响起，如同亿万厉鬼合在一起发出的怨气，灰雾激荡。\r\n\r\n    噗通一声，齐嵘刚稍微动弹，就又一头栽倒在那里，眼前发黑，再次昏死过去。\r\n\r\n    楚风头皮发麻，这还真是以天尊级以上进化者为食物的可怕生物，随意的低吼，就让齐嵘僵死过去。\r\n\r\n    其实，楚风也在庆幸，即便他有种魂光将崩开的感觉，但毕竟没有受到致命的冲击，对方未针对天尊以下的人。\r\n\r\n    他有点担心羽尚，怕他出现意外。\r\n\r\n    果然，这一刻他感受到大帐中有动静，羽尚要挣扎着出来。\r\n\r\n    “前辈，不要妄动，等在那里！”楚风急切传音，告诉羽尚，这是觅食者，专门针对强者，而他在外面却没事。\r\n\r\n    羽尚有些忧虑，怕楚风出现意外，但是，最终被楚风非常焦急的传音所阻，选择未动。\r\n\r\n    其实，他也动不了，觅食者又一次发出了嚎叫声，羽尚也倒下去了，昏死在地上。\r\n\r\n    这片地带清净了，两位天尊仰头栽倒，楚风僵立在原地，而其他人都跑了，逃出浓重的大雾区域。\r\n\r\n    在死寂中，楚风感应到一个生物在围绕着他转动，走了一圈，又注视别处，依旧在喃喃三生药。\r\n\r\n    随后，这里陷入死寂中，但是，楚风却越发觉得可怕，感觉像是脱离了阳间，进入一片莫名的世界。\r\n\r\n    阴雾翻涌，覆盖了天上地下。\r\n\r\n    无论是瞻州阵营还是贺州阵营，所有人都在眺望，都感觉不可思议，因为整片雍州阵营都像是陷入了阴间，坠入地府中，太昏暗了，阴气浓郁的吓死人。\r\n\r\n    在大雾中，在死寂中，楚风突然听到了幽远而又慑人的铃声，像是某种可怕的野兽脖子上挂着的铃铛在摇动。\r\n\r\n    同时，他感觉到了刺骨的寒气，觅食者就在附近，不时在眼前与背后出现，速度太快，忽左忽右，地面都在下沉，土层无声的湮灭，觅食者在寻找什么。\r\n\r\n    楚风彻底豁出去了，睁开火眼金睛，不然的话被对方来一下狠的，都不能提前发觉。\r\n\r\n    他想看一看所谓的觅食者到底是什么！\r\n\r\n    终于，他看到了，浓重的大雾中，有一个披头散发的人，正在移动，快到不可思议，在整片区域出没。\r\n\r\n    但是，他迈步时，无声无息，不断的幻灭，有几次几乎与楚风脸贴脸，难怪感受到对方的呼吸。\r\n\r\n    不过，他的面孔上披散着头发，看不清真容，而且即便是火眼金睛也不能透视，望不穿那发丝。\r\n\r\n    觅食者身上穿着破烂的衣物，很像是传说中的母金编织的金缕玉衣，可是却早已腐烂了，很难想象究竟经历了多么久远的岁月。\r\n\r\n    灰发披散，破烂衣服上是暗黑色的血迹，但早已干涸，这个人如同幽灵，偶尔发出嚎叫声，则慑人心魄，让人觉得灵魂都要随之而崩开！\r\n\r\n    这还是他所有气息内敛的结果，并不针对楚风这种弱小的生灵，不然的话，就如同天尊般，可能就死了。\r\n\r\n    不过，楚风也有所怀疑，这个觅食者并未吃齐嵘，他还好好的活着，只是昏厥过去了而已。\r\n\r\n    铃声来自哪里？并不是源自这个披头散发的觅食者。\r\n\r\n    嗯？！下一刻楚风震惊了。\r\n\r\n    他终于发现了秘密，很震撼，也很可怕，在这个觅食者背后的空间是塌陷的，宛若连着一方世界。\r\n\r\n    随着觅食者走动，那塌陷的空间也随之而动，他像是背负一方世界。\r\n\r\n    铃声源自那个塌陷的世界，有一只猛兽在那里面徘徊。\r\n\r\n    楚风深感吃惊，这是什么情况，背负一方世界的觅食者？\r\n\r\n    那空间中有什么秘密？\r\n\r\n    楚风双目中金色符号闪烁，反正双方都已经这么接近了，觅食者真要对他下手的话，也不会留情了。\r\n\r\n    他盯着塌陷的世界，想要窥尽秘密。\r\n\r\n    一瞬间，他感觉天旋地转，让他几乎要昏厥，因为那塌陷的世界在旋转，有种奇异的能量弥散。\r\n\r\n    那是一个漩涡，不断转动，像是一片黑暗的星空在缓缓旋转，要将人的心神吸附进去。\r\n\r\n    在那里面非常昏暗，像是螺旋而进，不断深入，在途中密密麻麻，有些生物，像是死尸，又像是失魂者，在漂浮，在游荡。\r\n\r\n    这是什么情况？\r\n\r\n    楚风深感震撼，觅食者背负的塌陷的漩涡世界中，像是一片死域，有各种丧尸般的东西在游荡着。\r\n\r\n    最为关键的是，这世界不断深入，螺旋而进，最深处那里传来浓郁的腐烂气息，死气滔天。\r\n\r\n    这很奇怪，楚风没有关注这个塌陷世界时，他没有闻到气息，可是现在，那腐烂味道与死气像是铺天盖地而来。\r\n\r\n    铃声就是源自螺旋而进的较深处世界中的一头猛兽，它在黑暗阴影中不断哀鸣。\r\n\r\n    很像是一头地狱犬，高大如山，漆黑如墨，很可怕。\r\n\r\n    楚风用力摇头，这情况很不对，觅食者背负塌陷世界，里面有诡异与妖邪的状况，怎么看都觉得太异常了。\r\n\r\n    楚风让自己静心，盯着漩涡世界，发现里面的许多行尸走肉都在无意识的在死域中走动，生前疑似无比强大。\r\n\r\n    他盯着那里，双目金色符号慑人，看到了那片死界中更深处的东西，有一些破碎的金属片。\r\n\r\n    当！\r\n\r\n    当他注视到那些悬浮的碎片时，竟听到了钟声，像是可以贯穿古今未来，震慑人心，让他整片心海都一阵悸动，心神都要成为空白了。\r\n\r\n    “有古怪！”楚风吃惊，没有放弃，继续盯着看，而且几乎要看到了那漩涡世界中的尽头。\r\n\r\n    恍惚间，他看到一个人，背对外界，盘坐在那里，身体前倾，一口破碎的大钟散落在那里，那人浑身是血，半伏在残钟上。\r\n\r\n    腐烂的气息，还浓郁的阴雾以那里为源头。\r\n\r\n    除此之外，透过那残钟，竟还映照出残缺而又模糊的景象，一口青铜棺染血，不知道葬着谁，坠落向远方。\r\n\r\n    “嗷吼……药来！”兽吼震动。\r\n\r\n    那是一种哭嚎声，以一种古语传来，楚风不可能听懂，但是有一股孱弱的精神能量荡漾，传到外界，让楚风意识到那是什么意思。\r\n\r\n    伴着兽吼声，伴着哭声，那漩涡世界中的黑色巨兽在震动。\r\n\r\n    楚风被惊的回过神来，他看不到漩涡最深处那背对外界而伏在参残钟上的染血身影了，可是，他却一阵心惊肉跳。\r\n\r\n    怎么感觉像是曾经看到过，在九号给予他观看的精神印记中曾有这个人出现。";
  Size size;
  int length;
  TextPainter textPainter;
  List<String> myarray;

  TextStyle getTextStyle() {
    return new TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
      textBaseline: TextBaseline.alphabetic,
      letterSpacing: 1.2,
      //  wordSpacing: 1.2,
    );
  }

  /// 获取带样式的文本对象
  TextSpan getTextSpan(String text) {
    return new TextSpan(text: text, style: getTextStyle());
  }

  List<String> getstr(String strs, int len) {
    myarray = new List<String>(pageCount);
    for (int j = 0; j < myarray.length; j++) {
      len = len <= strs.length ? len : strs.length;
      myarray[j] = strs.substring(0, len);
      strs = strs.substring(len);
    }
    return myarray;
  }

// 获取当前页内容
  String getPageCont(int index) {
    if (myarray.length > 0) {
      var s = myarray[index];
      var len = load(s);
      if (len != 0 && len < s.length) {
        // 判断是否重新计算
        myarray[index] = s.substring(0, len);
        if (myarray.length - 1 > index) {
          myarray[index + 1] = s.substring(len) + myarray[index + 1];
        }
      }
      return myarray[index];
    }
    return "";
  }

  /// 接收内容
  /// 追加内容返回false
  /// 计算完毕返回true
  int load(String text) {
    if (layout(text)) {
      return length;
    }

    int start = 0;
    int end = text.length;
    int mid = (end + start) ~/ 2;

    // 最多循环20次
    for (int i = 0; i < 20; i++) {
      if (layout(text.substring(0, mid))) {
        if (mid <= start || mid >= end) break;
        // 未越界
        start = mid;
        mid = (start + end) ~/ 2;
      } else {
        // 越界
        end = mid;
        mid = (start + end) ~/ 2;
      }
    }
    return mid;
  }

  /// 计算待绘制文本
  /// 未超出边界返回true
  /// 超出边界返回false
  bool layout(String text) {
    text = text ?? '';
    textPainter
      ..text = getTextSpan(text)
      ..layout(maxWidth: size.width);
    return !didExceed;
  }

  /// 是否超出边界
  bool get didExceed {
    return textPainter.didExceedMaxLines ||
        textPainter.size.height > size.height;
  }

  void getpage() {
    textPainter = new TextPainter(
        text: getTextSpan("text"), textDirection: TextDirection.ltr);
    int len = load(str);
    length = len;
    double s = str.length / length;
    int ss = str.length % length > 0 ? 1 : 0;
    pageCount = s.toInt() + ss;
    getstr(str, length);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraint) {
          size = new Size(
              constraint.maxWidth - 40.0, constraint.maxHeight - 100.0);
          getpage();
          /*  if (null == pageControllerFuture) {
            pageControllerFuture = lightEngine.controller;
          } */
          return new Container(
            color: Colors.black45,
            child: new FutureBuilder(
                future: pageControllerFuture,
                builder: (BuildContext context,
                    AsyncSnapshot<PageController> snapshot) {
                  return PageView.custom(
                      controller: controller,
                      childrenDelegate: new SliverChildBuilderDelegate(
                        pageBuilder,
                        childCount: pageCount,
                        addRepaintBoundaries: false,
                        addAutomaticKeepAlives: false,
                      ));
                }),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    // SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.dispose();
  }
}
