import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FixedNavItem extends StatefulWidget {
  String name;
  int index;
  int curIndex;
  GlobalKey fkey;
  FixedNavItem({Key key, this.name, this.index, this.curIndex, this.fkey})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FixedNavState();
  }
}

class _FixedNavState extends State<FixedNavItem> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      key: widget.fkey,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            widget.name,
            style: TextStyle(
                color: widget.curIndex == widget.index
                    ? Colors.blue
                    : Color.fromRGBO(51, 51, 51, 1),
                fontSize: 18,
                fontWeight: FontWeight.w700),
          ),
          widget.curIndex == widget.index
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
