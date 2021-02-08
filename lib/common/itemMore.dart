import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemMore extends StatelessWidget {
  final url;
  ItemMore({Key key, this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
        onTap: () => {print('tap')},
        child: Container(
          width: ScreenUtil().setWidth(58),
          height: ScreenUtil().setHeight(65),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 5),
                child: Image.network(
                    'https://cdn09.ehaier.com/shunguang/H5/www/img/sgmobile/home/new/more.png',
                    width: 24,
                    height: 24),
              ),
              Text(
                '查看更多',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              )
            ],
          ),
        ));
  }
}
