import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KingAreaWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => KingAreaState();
}

class KingAreaState extends State<KingAreaWidget> {
  ScrollController _controller;

  double left;

  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(() {
      // print(_controller.offset *
      //     ScreenUtil().setWidth(24) /
      //     (ScreenUtil().setWidth(70) * 5));
      setState(() {
        left = _controller.offset *
            ScreenUtil().setWidth(24) /
            (ScreenUtil().setWidth(70) * 5);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(left: 12, right: 12),
          height: ScreenUtil().setHeight(60),
          child: ListView(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              itemExtent: ScreenUtil().setWidth(70), //item延展尺寸(宽度)
              children: [
                KingItem(
                  imgUrl:
                      'http://cdn50.ehaier.com/mobile-cms-admin/uploadimagecontroller/image/2021/01/d749bdba26e14626a737b6585af21e82.png',
                  name: '领券中心',
                  color: Color.fromRGBO(254, 234, 179, 1),
                ),
                KingItem(
                  imgUrl:
                      'http://cdn50.ehaier.com/mobile-cms-admin/uploadimagecontroller/image/2021/01/038238bf14c74bab8042b7e588c82a80.png',
                  name: '分期购',
                  color: Color.fromRGBO(254, 234, 179, 1),
                ),
                KingItem(
                  imgUrl:
                      'http://cdn50.ehaier.com/mobile-cms-admin/uploadimagecontroller/image/2021/01/d749bdba26e14626a737b6585af21e82.png',
                  name: '领券中心',
                  color: Color.fromRGBO(254, 234, 179, 1),
                ),
                KingItem(
                  imgUrl:
                      'http://cdn50.ehaier.com/mobile-cms-admin/uploadimagecontroller/image/2021/01/038238bf14c74bab8042b7e588c82a80.png',
                  name: '分期购',
                  color: Color.fromRGBO(254, 234, 179, 1),
                ),
                KingItem(
                  imgUrl:
                      'http://cdn50.ehaier.com/mobile-cms-admin/uploadimagecontroller/image/2021/01/d749bdba26e14626a737b6585af21e82.png',
                  name: '领券中心',
                  color: Color.fromRGBO(254, 234, 179, 1),
                ),
                KingItem(
                  imgUrl:
                      'http://cdn50.ehaier.com/mobile-cms-admin/uploadimagecontroller/image/2021/01/038238bf14c74bab8042b7e588c82a80.png',
                  name: '分期购',
                  color: Color.fromRGBO(254, 234, 179, 1),
                ),
                KingItem(
                  imgUrl:
                      'http://cdn50.ehaier.com/mobile-cms-admin/uploadimagecontroller/image/2021/01/d749bdba26e14626a737b6585af21e82.png',
                  name: '领券中心',
                  color: Color.fromRGBO(254, 234, 179, 1),
                ),
                KingItem(
                  imgUrl:
                      'http://cdn50.ehaier.com/mobile-cms-admin/uploadimagecontroller/image/2021/01/038238bf14c74bab8042b7e588c82a80.png',
                  name: '分期购',
                  color: Color.fromRGBO(254, 234, 179, 1),
                ),
              ]),
        ),
        Container(
          width: ScreenUtil().setWidth(24),
          height: ScreenUtil().setHeight(4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(18.0)),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: left,
                bottom: 0,
                child: Container(
                  width: ScreenUtil().setWidth(10),
                  height: ScreenUtil().setHeight(4),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(18.0)),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class KingItem extends StatelessWidget {
  final String imgUrl;
  final String name;
  final Color color;
  KingItem({Key key, this.imgUrl, this.name, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(imgUrl, width: 48, height: 48),
        Text(name, style: TextStyle(fontSize: 12, color: color)),
      ],
    );
  }
}
