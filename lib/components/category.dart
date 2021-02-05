import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(left: 12, right: 12),
      child: Column(
        children: [
          Row(
            children: [
              CategoryItem(
                name: '冰箱',
                color: Color.fromRGBO(254, 234, 179, 1),
                imgUrl:
                    'http://cdn50.ehaier.com/mobile-cms-admin/uploadimagecontroller/image/2021/01/0044dc59f54d420bb56a0f864cc3f4cf.png',
              ),
              CategoryItem(
                name: '冰箱',
                color: Color.fromRGBO(254, 234, 179, 1),
                imgUrl:
                    'http://cdn50.ehaier.com/mobile-cms-admin/uploadimagecontroller/image/2021/01/0044dc59f54d420bb56a0f864cc3f4cf.png',
              ),
              CategoryItem(
                name: '冰箱',
                color: Color.fromRGBO(254, 234, 179, 1),
                imgUrl:
                    'http://cdn50.ehaier.com/mobile-cms-admin/uploadimagecontroller/image/2021/01/0044dc59f54d420bb56a0f864cc3f4cf.png',
              ),
              CategoryItem(
                name: '冰箱',
                color: Color.fromRGBO(254, 234, 179, 1),
                imgUrl:
                    'http://cdn50.ehaier.com/mobile-cms-admin/uploadimagecontroller/image/2021/01/0044dc59f54d420bb56a0f864cc3f4cf.png',
              ),
              CategoryItem(
                name: '冰箱',
                color: Color.fromRGBO(254, 234, 179, 1),
                imgUrl:
                    'http://cdn50.ehaier.com/mobile-cms-admin/uploadimagecontroller/image/2021/01/0044dc59f54d420bb56a0f864cc3f4cf.png',
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CategoryItem(
                name: '厨房电器',
                color: Color.fromRGBO(254, 234, 179, 1),
                imgUrl:
                    'http://cdn50.ehaier.com/mobile-cms-admin/uploadimagecontroller/image/2021/01/a6ba5b476c214fc19f2cdf1942a954c7.png',
              ),
              CategoryItem(
                name: '厨房电器',
                color: Color.fromRGBO(254, 234, 179, 1),
                imgUrl:
                    'http://cdn50.ehaier.com/mobile-cms-admin/uploadimagecontroller/image/2021/01/a6ba5b476c214fc19f2cdf1942a954c7.png',
              )
            ],
          )
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String imgUrl;
  final Color color;
  final String name;

  CategoryItem({Key key, this.imgUrl, this.color, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.only(top: 5, bottom: 8),
        width: ScreenUtil().setWidth(70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(imgUrl, width: 42, height: 42),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Text(name,
                  style: TextStyle(
                    color: color,
                  )),
            )
          ],
        ));
  }
}
