import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MiddleBannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(left: 12, right: 12),
      child: Image.network(
          'http://cdn50.ehaier.com/mobile-cms-admin/uploadimagecontroller/image/2021/01/3f40aa1af6cf431c8be54971356512a0.gif',
          width: double.infinity,
          height: ScreenUtil().setHeight(82),
          fit: BoxFit.contain),
    );
  }
}
