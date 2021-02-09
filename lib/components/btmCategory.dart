import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';
import '../common/eventUtil.dart';

class BtmCategory extends StatefulWidget {
  GlobalKey btmCatekey;
  List tabNav;
  int curIndex;
  BtmCategory({Key key, this.btmCatekey, this.tabNav, this.curIndex})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _BtmCategoryState();
  }
}

class _BtmCategoryState extends State<BtmCategory> {
  PageController _pageController = PageController();
  void Function(int) pageCall;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: widget.btmCatekey,
      child: Column(
        children: [
          TabListNav(
            curIndex: widget.curIndex,
            tabNav: widget.tabNav,
          ),
          Container(
            height: ScreenUtil().setHeight(700),
            color: Colors.blue,
            child: Center(
              child: Text('center'),
            ),
          ),
        ],
      ),
    );
  }
}

class TabListNav extends StatefulWidget {
  final tabNav;
  int curIndex;
  TabListNav({Key key, this.tabNav, this.curIndex}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TabListNavState();
  }
}

class _TabListNavState extends State<TabListNav> {
  List<GlobalKey> keys = <GlobalKey>[];
  ScrollController _controller = ScrollController();
  StreamSubscription subscription;

  void Function(void Function(int)) setCall;

  int curItem;

  int tabLength;

  void itemClick(pos) {
    // print(pos);
    setState(() {
      curItem = pos;
    });
    scrollItemToCenter(pos);
    EventUtil.fire(CustomEvent('nav', pos));
  }

  //滚动Item到指定位置，这里滚动到屏幕正中间
  void scrollItemToCenter(int pos) {
    //获取item的尺寸和位置
    RenderBox box = keys[pos].currentContext.findRenderObject();
    Offset os = box.localToGlobal(Offset.zero);

    //double h=box.size.height;
    double w = box.size.width;
    double x = os.dx;
    //double y=os.dy;

    //获取屏幕宽高
    double windowW = MediaQuery.of(context).size.width;
    //double windowH=MediaQuery.of(context).size.height;

    //就算当前item距离屏幕中央的相对偏移量
    double rlOffset = windowW / 2 - (x + w / 2);

    //计算_controller应该滚动的偏移量
    double offset = _controller.offset - rlOffset;
    _controller.animateTo(offset,
        duration: Duration(milliseconds: 200), curve: Curves.linear);
  }

  @override
  void initState() {
    super.initState();
    curItem = widget.curIndex;
    tabLength = widget.tabNav?.length;
    for (int i = 0; i < tabLength; i++) {
      keys.add(GlobalKey(
          debugLabel:
              'tabnav_' + widget.tabNav[i]['productCateId'].toString()));
    }

    //监听子组件事件
    subscription = EventUtil.on<CustomEvent>((event) {
      print('+++++++++');
      print(event.name);
      scrollItemToCenter(event.value);
    });
  }

  @override
  void didUpdateWidget(TabListNav oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      curItem = widget.curIndex;
    });
  }

  Widget tabItem(context, pos) {
    return Container(
        height: ScreenUtil().setHeight(50),
        key: keys[pos],
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.5),
            child: Container(
              margin: EdgeInsets.only(top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.tabNav[pos]['name'],
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: curItem == pos
                            ? Colors.blue
                            : Color.fromRGBO(51, 51, 51, 1)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 3),
                    child: Container(
                        // height: ScreenUtil().setHeight(20),
                        decoration: curItem == pos
                            ? BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10))
                            : null,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            widget.tabNav[pos]['tag'],
                            style: TextStyle(
                                color: curItem == pos
                                    ? Colors.white
                                    : Color.fromRGBO(153, 153, 153, 1),
                                fontSize: 10),
                          ),
                        )),
                  )
                ],
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(246, 246, 246, 1),
      ),
      height: ScreenUtil().setHeight(50),
      child: ListView.builder(
        // physics: ClampingScrollPhysics(),
        controller: _controller,
        scrollDirection: Axis.horizontal,
        itemCount: tabLength,
        itemBuilder: (context, pos) {
          return InkWell(
            onTap: () async {
              itemClick(pos);
            },
            child: tabItem(context, pos),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    subscription.cancel(); //State销毁时，清理注册
  }
}
