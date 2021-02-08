import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextOverflowInfo extends StatelessWidget {
  final width;
  final text;
  final lines;
  final Color color;
  final double fontsize;
  final fontweight;
  TextOverflowInfo(
      {Key key,
      this.text,
      this.width,
      this.lines = 1,
      this.color = Colors.white,
      this.fontsize = 12.0,
      this.fontweight = 5})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: ScreenUtil().setWidth(width),
      child: Text(
        text,
        softWrap: true,
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
        maxLines: lines,
        style: TextStyle(
            fontSize: fontsize.toDouble(),
            color: color,
            fontWeight: FontWeight.values[fontweight]),
      ),
    );
  }
}
