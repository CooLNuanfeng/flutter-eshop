import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/textoverflow.dart';

class FlexBigArea extends StatelessWidget {
  final title;
  final desc;
  final link;
  final more;
  final color;
  final img;
  FlexBigArea(
      {Key key,
      this.title,
      this.link,
      this.desc,
      this.more,
      this.color,
      this.img})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: ScreenUtil().setWidth(160),
      height: ScreenUtil().setHeight(117),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  width: ScreenUtil().setWidth(80),
                  child: TextOverflowInfo(
                    width: 80,
                    color: Color.fromRGBO(51, 51, 51, 1),
                    text: title,
                    fontweight: 6,
                    fontsize: 16.0,
                  )),
              Container(
                  height: ScreenUtil().setHeight(14),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: color, style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextOverflowInfo(
                          width: 50,
                          color: color,
                          text: more,
                          fontweight: 4,
                          fontsize: 11,
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: color,
                          size: 12,
                        )
                      ],
                    ),
                  ))
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 2),
            alignment: Alignment.centerLeft,
            child: TextOverflowInfo(
              width: 150,
              color: color,
              text: desc,
              fontsize: 12,
            ),
          ),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: Image.network(img,
                width: ScreenUtil().setWidth(160),
                height: ScreenUtil().setHeight(84)),
          ),
        ],
      ),
    );
  }
}
