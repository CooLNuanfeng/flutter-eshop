import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NearShop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 12, left: 12, right: 12),
      width: ScreenUtil().setHeight(320),
      height: ScreenUtil().setHeight(90),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Colors.white),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: nearShopWidget(),
      ),
    );
  }
}

class nearShopWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Container(
          width: ScreenUtil().setWidth(340),
          child: Text(
            '附近店铺',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        Row(
          children: [],
        )
      ],
    );
  }
}
