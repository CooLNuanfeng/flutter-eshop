import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'dart:async';

class RefreshHeader extends Header {
  final Key key;
  final Color color;
  final Color backgroundColor;
  final LinkHeaderNotifier linkNotifier = LinkHeaderNotifier();

  RefreshHeader({
    this.key,
    this.color = Colors.white,
    this.backgroundColor = Colors.transparent,
    bool enableHapticFeedback = true,
    bool enableInfiniteRefresh = false,
  }) : super(
          extent: 60, //Header的高度
          triggerDistance: 60, //触发刷新的距离
          float: false, //是否浮动
          enableHapticFeedback: enableHapticFeedback,
          enableInfiniteRefresh: enableInfiniteRefresh,
        );

  Widget contentBuilder(
      BuildContext context,
      RefreshMode refreshState,
      double pulledExtent,
      double refreshTriggerPullDistance,
      double refreshIndicatorExtent,
      AxisDirection axisDirection,
      bool float,
      Duration completeDuration,
      bool enableInfiniteRefresh,
      bool success,
      bool noMore) {
    linkNotifier.contentBuilder(
        context,
        refreshState,
        pulledExtent,
        refreshTriggerPullDistance,
        refreshIndicatorExtent,
        axisDirection,
        float,
        completeDuration,
        enableInfiniteRefresh,
        success,
        noMore);
    return RefreshHeaderWidget(
      key: key,
      color: color,
      backgroundColor: backgroundColor,
      linkNotifier: linkNotifier,
    );
  }
}

class RefreshHeaderWidget extends StatefulWidget {
  final Color color;
  final Color backgroundColor;
  final LinkHeaderNotifier linkNotifier;

  RefreshHeaderWidget(
      {Key key, this.color, this.backgroundColor, this.linkNotifier})
      : super(key: key);
  @override
  _RefreshHeaderState createState() => _RefreshHeaderState();
}

class _RefreshHeaderState extends State<RefreshHeaderWidget> {
  //刷新状态
  String status = '下拉刷新';
  // 默认动画块的数量
  int count = 5;

  bool animated = false;

  List<LoadingItemAnimate> listContent = [];

  RefreshMode get _refreshState => widget.linkNotifier.refreshState;
  double get _indicatorExtent => widget.linkNotifier.refreshIndicatorExtent;

  @override
  void initState() {
    super.initState();
    _buildContent();
  }

  _buildContent() {
    for (var i = 0; i < count; i++) {
      listContent.add(LoadingItemAnimate(
          color: widget.color,
          width: 5,
          height: 10,
          stretch: 10,
          delay: i * 200));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_refreshState == RefreshMode.drag) {
      print('start');
      setState(() {
        status = '下拉刷新';
        animated = true;
      });
    } else if (_refreshState == RefreshMode.armed) {
      setState(() {
        status = '加载中';
      });
    } else if (_refreshState == RefreshMode.done ||
        _refreshState == RefreshMode.inactive) {
      setState(() {
        status = '加载完成';
        animated = false;
      });
    }
    return Container(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: _indicatorExtent,
          child: Column(children: [
            Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: listContent),
                )),
            Expanded(
                flex: 1,
                child: Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      status,
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          decoration: TextDecoration.none),
                    )))
          ]),
        ));
  }
}

class LoadingItemAnimate extends StatefulWidget {
  final Color color;
  final double width;
  final double height;
  final double stretch; //伸缩尺寸
  final int delay;
  LoadingItemAnimate(
      {Key key, this.color, this.width, this.height, this.stretch, this.delay})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => _LoadingItemAnimateState();
}

class _LoadingItemAnimateState extends State<LoadingItemAnimate>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  final defaultHeight = 5;

  @override
  void initState() {
    super.initState();
    _initAnimation();
  }

  _initAnimation() {
    controller =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    animation = Tween(
            begin: widget.height - defaultHeight,
            end: widget.height + widget.stretch)
        .animate(controller)
          ..addListener(() {
            setState(() {});
          });
    Timer(Duration(milliseconds: widget.delay), () {
      controller.repeat(reverse: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 2, right: 2),
      width: widget.width,
      height: animation.value,
      color: widget.color,
    );
  }

  @override
  void dispose() {
    // 释放资源
    controller.dispose();
    super.dispose();
  }
}
