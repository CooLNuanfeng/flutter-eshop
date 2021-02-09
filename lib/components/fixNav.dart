import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';
import './fixedItemNav.dart';
import '../common/eventUtil.dart';

class FixNav extends StatefulWidget {
  // ScrollController fixedNavController;
  double statusHeight;
  List fixedKeys;
  int curIndex;
  List tabData;
  FixNav(
      {Key key,
      this.curIndex,
      // this.fixedNavController,
      this.statusHeight,
      this.tabData,
      this.fixedKeys})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FixNavState();
  }
}

class _FixNavState extends State<FixNav> with WidgetsBindingObserver {
  ScrollController _fixedNavController;
  int curItem;
  StreamSubscription subscription;

  void itemNavClick(pos) {
    setState(() {
      curItem = pos;
    });
    EventUtil.fire(CustomEvent('navfix', pos));
    scrollItemToCenter(pos);
  }

  void scrollItemToCenter(pos) {
    print('scrollItemToCenter');
    //获取item的尺寸和位置
    if (widget.fixedKeys[pos] != null) {
      RenderBox box = widget.fixedKeys[pos].currentContext.findRenderObject();
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
      double offset = _fixedNavController.offset - rlOffset;
      print(offset);
      _fixedNavController.animateTo(offset,
          duration: Duration(milliseconds: 200), curve: Curves.linear);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fixedNavController = ScrollController();
    WidgetsBinding.instance.addObserver(this); //注册监听器
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print("FixNav 单次Frame绘制回调"); //只回调一次
      print(widget.curIndex);
      setState(() {
        curItem = widget.curIndex;
      });
      scrollItemToCenter(widget.curIndex);
    });
  }

  void dispose() {
    super.dispose();
    subscription.cancel();
    _fixedNavController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Positioned(
      top: 50 + widget.statusHeight,
      left: 0,
      right: 0,
      height: 45,
      child: Container(
        height: ScreenUtil().setHeight(45),
        color: Colors.white,
        child: ListView.builder(
          // physics: ClampingScrollPhysics(),
          controller: _fixedNavController,
          scrollDirection: Axis.horizontal,
          itemCount: widget.tabData.length,
          itemBuilder: (context, pos) {
            return InkWell(
              onTap: () async {
                itemNavClick(pos);
              },
              child: navItem(context, pos),
            );
          },
        ),
      ),
    );
  }

  Widget navItem(context, pos) {
    // TODO: implement build
    return Container(
      key: widget.fixedKeys[pos],
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            widget.tabData[pos]['name'],
            style: TextStyle(
                color: widget.curIndex == pos
                    ? Colors.blue
                    : Color.fromRGBO(51, 51, 51, 1),
                fontSize: 18,
                fontWeight: FontWeight.w700),
          ),
          widget.curIndex == pos
              ? Container(
                  margin: EdgeInsets.only(top: 3),
                  height: ScreenUtil().setHeight(3),
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue),
                )
              : Container(
                  margin: EdgeInsets.only(top: 3),
                  height: ScreenUtil().setHeight(3),
                  color: Colors.white,
                ),
        ],
      ),
    );
  }
}
