import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../common/textoverflow.dart';

class FlexSmallArea extends StatelessWidget {
  final title;
  final desc;
  final link;
  final color;
  final img;
  FlexSmallArea(
      {Key key, this.title, this.link, this.desc, this.color, this.img})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: ScreenUtil().setWidth(77),
      height: ScreenUtil().setHeight(117),
      child: Column(
        children: [
          Container(
              width: ScreenUtil().setWidth(77),
              child: TextOverflowInfo(
                width: 77,
                color: Color.fromRGBO(51, 51, 51, 1),
                text: title,
                fontweight: 6,
                fontsize: 16.0,
              )),
          Container(
            margin: EdgeInsets.only(
              top: 2,
            ),
            alignment: Alignment.centerLeft,
            child: TextOverflowInfo(
              width: 75,
              color: color,
              text: desc,
              fontsize: 12,
            ),
          ),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: Image.network(img,
                width: ScreenUtil().setWidth(77),
                height: ScreenUtil().setHeight(77)),
          ),
        ],
      ),
    );
  }
}
